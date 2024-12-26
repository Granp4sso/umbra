
/////////////////////////////////////////////////////////////////
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>
//     ___       ___       ___       ___       ___   
//    /\__\     /\__\     /\  \     /\  \     /\  \  
//   /:/ _/_   /::L_L_   /::\  \   /::\  \   /::\  \ 
//  /:/_/\__\ /:/L:\__\ /::\:\__\ /::\:\__\ /::\:\__\
//  \:\/:/  / \/_/:/  / \:\::/  / \;:::/  / \/\::/  /
//   \::/  /    /:/  /   \::/  /   |:\/__/    /:/  / 
//    \/__/     \/__/     \/__/     \|__|     \/__/  
//
// Add some description here ...

#![no_main]
#![no_std]

use core::arch::global_asm;
//use core::arch::asm;

// Local Modules
pub mod panic;
pub mod startup;
pub mod non_secure;
pub mod non_secure_callable;

// Crates
use arm::sau;
use stm32l552::gtzc;

// Use
use memory_protection_server::memory_guard::MemorySecurityGuardTrait;

#[no_mangle]
#[allow(dead_code)]
#[allow(unreachable_code)]
#[allow(unused_assignments)]

pub unsafe fn main() -> !{

    //////////////////////////////
    // INITIALIZE MEMORY GUARDS //
    //////////////////////////////

    let mut sau_driver : sau::SauDriver = sau::SauDriver::new();
    let mut gtzc_driver : gtzc::GtzcDriver = gtzc::GtzcDriver::new();
    sau_driver.memory_security_guard_init();
    gtzc_driver.memory_security_guard_init();

    //////////////////////////////////////////////////
    // CONFIGURE NON-SECURE CODE - FLASH CONTROLLER //
    //////////////////////////////////////////////////

    // The flash controller is initially configured offline at the bank level. 
    // Currently, 0x08000000 is designated as watermarked (i.e., secure), 
    // while 0x08040000 is non-watermarked, making it non-secure. 
    // Pages (2 KB each) within non-watermarked blocks can be selectively modified to be secure.

    /////////////////////////////////////
    // CONFIGURE NON-SECURE CODE - SAU //
    /////////////////////////////////////

    let mut memory_block_list = memory_layout::MemoryBlockList::create_from_range(0x08040000,0x08060000);
    memory_block_list.set_memory_block_security(memory_layout::MemoryBlockSecurityAttribute::Untrusted);
    sau_driver.memory_security_guard_create(&memory_block_list);

    /////////////////////////////////////
    // CONFIGURE NON-SECURE DATA - SAU //
    /////////////////////////////////////

    // Let's use region 1 to define the whole SRAM1 as Non-secure
    memory_block_list = memory_layout::MemoryBlockList::create_from_range(0x20000000,0x2002ffe0);
    memory_block_list.set_memory_block_security(memory_layout::MemoryBlockSecurityAttribute::Untrusted);
    sau_driver.memory_security_guard_create(&memory_block_list);

    /////////////////////////////////////////////////
    // CONFIGURE NON-SECURE DATA - SRAM CONTROLLER //
    /////////////////////////////////////////////////

    // Similarly to Flash controller, SRAM pages are defined secure by default.
    // It means that even if the SAU marks the SRAM1 as non-secure, the SRAM
    // Controller would generate a Bus exception. therefore, we must also
    // Instruct the SRAM controller to allow SRAM1 accesses from non-secure code.

    // Check Memory Protection Controller Block Based (MPCBB)
    // A block is 256 Bytes in size, A superblock is 256x32 = 8KB
    // SRAM1 is made of 192/8=24 super blocks, while SRAM2 has 8 superblocks

    // Reset all block security bits To make all blocks non-secure for SRAM1
    memory_block_list = memory_layout::MemoryBlockList::create_from_range(0x20000000,0x20030000);
    memory_block_list.set_memory_block_security(memory_layout::MemoryBlockSecurityAttribute::Untrusted);
    gtzc_driver.memory_security_guard_create(&memory_block_list);

    ///////////////////////////////////
    // CONFIGURE NON-SECURE CALLABLE //
    ///////////////////////////////////

    // Configure the non-secure callable region here
    memory_block_list = memory_layout::MemoryBlockList::create_from_range(0x08030000,0x0803ffe0);
    memory_block_list.set_memory_block_security(memory_layout::MemoryBlockSecurityAttribute::TrustedGateway);
    sau_driver.memory_security_guard_create(&memory_block_list);

    /////////////////////////////////////
    // Jump to Non-Secure World        //
    /////////////////////////////////////
    jump_to_ns_fn();
    // ns_fn();
    
    
    loop {}

}


#[cfg(all(target_arch = "arm", target_os = "none"))]
extern "C" {
    pub fn jump_to_ns_fn();
}
#[cfg(all(target_arch = "arm", target_os = "none"))]
global_asm!(
    "
    .section .text
    .global jump_to_ns_fn
    .extern _host_Reset_Handler         

    jump_to_ns_fn:
        ldr r0, =_host_Reset_Handler    // Load the address of ns_fn 
        movs r1, #1
        bics r0, r1                     // Clear bit 0 of address in r0 
        blxns r0                        // Branch to the non-secure function 

    "
);


#[no_mangle]
#[allow(unreachable_code)]
pub unsafe fn s_fn() -> !{

    loop {}

}