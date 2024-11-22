
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
// use secboot::*;

#[no_mangle]
#[allow(dead_code)]
#[allow(unreachable_code)]
#[allow(unused_assignments)]
pub unsafe fn main() -> !{

    //////////////////////////////////////////////////
    // CONFIGURE NON-SECURE CODE - FLASH CONTROLLER //
    //////////////////////////////////////////////////

    // Flash controller configuration is first performed offline at a bank level.
    // Currently 0x08000000 is set as watermakerd (i.e. secure), while 0x08040000
    // is not-watermarked, hence non-secure. It is possible to selectively modify
    // Pages (2kb) in non-watermarked blocks to be secure. 

    /////////////////////////////////////
    // CONFIGURE NON-SECURE CODE - SAU //
    /////////////////////////////////////

    // Configure the SAU
    let sau_addr:u32 = 0xE000EDD0;
    let sau_ptr:*mut u32 = sau_addr as *mut u32;

    let sau_ctrl = sau_ptr;
    let sau_type = sau_ptr.wrapping_add(1);
    let sau_region = sau_ptr.wrapping_add(2);
    let sau_rbar = sau_ptr.wrapping_add(3);
    let sau_rlar = sau_ptr.wrapping_add(4);

    // First, since enable bits for SAU regions are undefined at reset, we must clear them explicitly
    let region_num : u8 = *(sau_type) as u8;
    for i in 0..region_num {
        // First, select the region
        *(sau_region) = i as u32;
        // Let's clear the region enable bit
        *(sau_rlar) &= 0xfffffffe;
    }

    // By default non-defined regions are SECURE, therefore we must define the Non-secure region
    let base_addr : u32 = 0x08040000;
    let limit_addr : u32 = 0x08060000;      // Sau will set 5 LSB to 1
    let nsc : u32 = 0x0;                    // NSC = 0 means the region is not NSC, hence it is non secure
    let en : u32 = 0x1;                     // EN = 1 means the region is ENABLED
    let new_rlar = limit_addr | (nsc << 1) | en; 

    *(sau_region) = 0;                      // Select region 0
    *(sau_rbar) = base_addr;                // Select the base address 
    *(sau_rlar) = new_rlar;                 // Select the limit address, security and enable

    *(sau_ctrl) = 0x1;                      // Enable the SAU, otherwise the whole memory is secure

    /////////////////////////////////////
    // CONFIGURE NON-SECURE DATA - SAU //
    /////////////////////////////////////

    // Let's use region 1 to define the whole SRAM1 as Non-secure

    let base_addr : u32 = 0x20000000;
    let limit_addr : u32 = 0x2002ffe0;      // 0x2002ffe0 + 0001f = 0x2002ffff, which is top of stack
    let nsc : u32 = 0x0;                    // NSC = 0 means the region is not NSC, hence it is non secure
    let en : u32 = 0x1;                     // EN = 1 means the region is ENABLED
    let new_rlar = limit_addr | (nsc << 1) | en; 

    *(sau_region) = 1;                      // Select region 1
    *(sau_rbar) = base_addr;                // Select the base address 
    *(sau_rlar) = new_rlar;                 // Select the limit address, security and enable

    *(sau_ctrl) = 0x1;                      // Enable the SAU, otherwise the whole memory is secure

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

    let gtzc_addr:u32 = 0x40032400;
    let gtzc_ptr:*mut u32 = gtzc_addr as *mut u32;

    let mpcbb1_ptr = gtzc_ptr.wrapping_add(0x800/4);
    let _mpcbb1_cr = mpcbb1_ptr;
    let mpcbb1_vctr = mpcbb1_ptr.wrapping_add(0x100/4);

    // Configure all 24 Superblocks as Non-Secure
    for i in 0..24 {
        // Each bit corresponds to a block. Reset all block security bit
        // To make all blocks non-secure
        *(mpcbb1_vctr.wrapping_add(i)) = 0x00000000;
    }

    ///////////////////////////////////
    // CONFIGURE NON-SECURE CALLABLE //
    ///////////////////////////////////

    // Configure the non-secure callable region here
    let base_addr : u32 = 0x08030000;
    let limit_addr : u32 = 0x0803ffe0;      
    let nsc : u32 = 0x1;                    // NSC = 1
    let en : u32 = 0x1;                     // EN = 1 means the region is ENABLED
    let new_rlar = limit_addr | (nsc << 1) | en; 

    *(sau_region) = 2;                      // Select region 2
    *(sau_rbar) = base_addr;                // Select the base address 
    *(sau_rlar) = new_rlar;                 // Select the limit address, security and enable

    *(sau_ctrl) = 0x1;                      // Enable the SAU, otherwise the whole memory is secure

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