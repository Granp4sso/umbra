
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
use memory_protection_server::cpu_guard;
use stm32l552::gtzc;

// Use
use memory_protection_server::cpu_guard::CpuSecurityGuardTrait;



#[no_mangle]
#[allow(dead_code)]
#[allow(unreachable_code)]
#[allow(unused_assignments)]

pub unsafe fn main() -> !{


    let mut sau_driver : sau::SauDriver = sau::SauDriver::new();
    let mut security_region : cpu_guard::GuardSecurityRegion = cpu_guard::GuardSecurityRegion::new();
    
    sau_driver.cpu_guard_security_init();

    security_region.memory_region.base_addr = 0x08040000;
    security_region.memory_region.limit_addr = 0x08060000;
    security_region.memory_id = 0x0;
    security_region.memory_security_attribute = cpu_guard::GuardSecurityAttribute::Untrusted;

    sau_driver.cpu_guard_security_init();
    sau_driver.cpu_guard_security_region_create(&security_region);

    /*

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

    // Initialize the SAU
    let mut sau_driver : sau::SauDriver = sau::SauDriver::new();
    let mut sau_region_config : sau::SauRegionConfig = sau::SauRegionConfig::new();

    sau_driver.init();
    sau_driver.enable();

    // By default non-defined regions are SECURE, therefore we must define the Non-secure region
    sau_region_config.set_base_addr(0x08040000);
    sau_region_config.set_limit_addr(0x08060000);
    sau_region_config.set_nsc(0x0);
    sau_region_config.set_en(0x1);
    sau_region_config.set_rnum(0x0);

    sau_driver.create_region(&sau_region_config);

    /////////////////////////////////////
    // CONFIGURE NON-SECURE DATA - SAU //
    /////////////////////////////////////

    // Let's use region 1 to define the whole SRAM1 as Non-secure
    sau_region_config.set_base_addr(0x20000000);
    sau_region_config.set_limit_addr(0x2002ffe0);
    sau_region_config.set_nsc(0x0);
    sau_region_config.set_en(0x1);
    sau_region_config.set_rnum(0x1);

    sau_driver.create_region(&sau_region_config);

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

    /*let gtzc_addr:u32 = 0x40032400;
    let gtzc_ptr:*mut u32 = gtzc_addr as *mut u32;

    let mpcbb1_ptr = gtzc_ptr.wrapping_add(0x800/4);
    let _mpcbb1_cr = mpcbb1_ptr;
    let mpcbb1_vctr = mpcbb1_ptr.wrapping_add(0x100/4);

    // Configure all 24 Superblocks as Non-Secure
    for i in 0..24 {
        // Each bit corresponds to a block. Reset all block security bit
        // To make all blocks non-secure
        *(mpcbb1_vctr.wrapping_add(i)) = 0x00000000;
    }*/

    let mut gtzc_driver : gtzc::GtzcDriver = gtzc::GtzcDriver::new();

    // Reset all block security bits To make all blocks non-secure
    let memory_bank_id : u8 = 0;
    let security_attribute : u8 = 0; // Non secure
    gtzc_driver.set_memory_bank_security(memory_bank_id, security_attribute);

    ///////////////////////////////////
    // CONFIGURE NON-SECURE CALLABLE //
    ///////////////////////////////////

    // Configure the non-secure callable region here
    sau_region_config.set_base_addr(0x08030000);
    sau_region_config.set_limit_addr(0x0803ffe0);
    sau_region_config.set_nsc(0x1);
    sau_region_config.set_en(0x1);
    sau_region_config.set_rnum(0x2);

    sau_driver.create_region(&sau_region_config);

    /////////////////////////////////////
    // Jump to Non-Secure World        //
    /////////////////////////////////////
    jump_to_ns_fn();
    // ns_fn();
    */
    
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