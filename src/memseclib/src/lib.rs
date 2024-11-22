
//////////////////////////////////////////////////////////////////
//                                                              //
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>   //
//                                                              //
// Description:                                                 //
//  This Crate provides peripheral and memory security control. //
//  It exposes the functionalities to program the security      //
//  memory hiearchy of the system.                              //
//  It is directly reused by the secure-boot crate and the      //
//  higher-level crates.                                        //
//                                                              //
//////////////////////////////////////////////////////////////////

#![crate_name = "memseclib"]
#![crate_type = "rlib"]
#![no_std]

// SAU (TBD)
// IDAU (TBD)
// Flash (TBD)
pub mod flash;
// SRAMs (TBD)
// External Memories (TBD)


pub fn add(left: usize, right: usize) -> usize {
    left + right
}
