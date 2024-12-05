

//////////////////////////////////////////////////////////////////
//                                                              //
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>   //
//                                                              //
// Description (TBD)
//                                                              //
//////////////////////////////////////////////////////////////////

//use arm::sau::SAU;

// The CPU Guard module implements the methods to access the hardware-defined
// memory protection unit implemented in CPUs. Examples are ARM SAU, MPU and
// RISC-V PMP.

//pub type CpuSecurityGuard = SAU;

pub trait CpuSecurityGuardTrait {

    fn init(&self);

}

pub trait CpuAccessGuardTrait {
    // TBD
}
