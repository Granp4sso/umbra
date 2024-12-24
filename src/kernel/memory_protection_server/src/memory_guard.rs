

//////////////////////////////////////////////////////////////////
//                                                              //
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>   //
//                                                              //
// Description (TBD)
//                                                              //
//////////////////////////////////////////////////////////////////

// The CPU Guard module implements the methods to access the hardware-defined
// memory protection unit implemented in CPUs. Examples are ARM SAU, MPU and
// RISC-V PMP.

use memory_layout::MemoryBlockList;

//////////////////////////////
// Memory Guard Trait //
//////////////////////////////

pub trait MemorySecurityGuardTrait {

    fn memory_security_guard_init(&mut self);
    // Create Region
    fn memory_security_guard_create(&mut self, memory_block_list: & MemoryBlockList);
    // Delete Region
    // Destroy

}

pub trait MemoryAccessGuardTrait {
    // TBD
}
