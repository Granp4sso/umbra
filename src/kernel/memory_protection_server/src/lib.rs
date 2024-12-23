
//////////////////////////////////////////////////////////////////
//                                                              //
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>   //
//                                                              //
// Description (TBD)
//                                                              //
//////////////////////////////////////////////////////////////////

// The Memory Protection Server (MPS) serves as Umbra's lowest-level interface to the hardware. 
// It provides abstract methods for accessing the physical memory protection units implemented on the target device. 
// Upper layers invoke the MPS to configure protected memory regions. 
// Modern microcontrollers implement multi-layered security models, where a memory access must be permitted by 
// all security controllers, including the CPU, flash controller, and RAM controller.

#![crate_name = "memory_protection_server"]
#![crate_type = "rlib"]
#![no_std]

pub mod cpu_guard;
pub mod flash_guard;
pub mod ram_guard;