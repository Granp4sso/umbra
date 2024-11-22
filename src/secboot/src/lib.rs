
//////////////////////////////////////////////////////////////////
//                                                              //
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>   //
//                                                              //
// Description:                                                 //
//  This Crate implements the zero stage bootloader,            //
//  which purpose is to configure the system secure memory      //
//                                                              //
//////////////////////////////////////////////////////////////////

#![crate_name = "secboot"]
#![crate_type = "rlib"]
#![no_std]

// By default, on STM32L552 and STM32L562, Once TZEN is set,
// The whole system is fully set as secure. Specifically:
// -CPU
//      All interrupts (NVIC) are secure and the SAU 
//      memory map is entirely secure
// -Flash
//      Watermarked regions are secure, while pages are
//      Entirely defined as non-secure. 


pub fn add(left: usize, right: usize) -> usize {
    left + right
}
