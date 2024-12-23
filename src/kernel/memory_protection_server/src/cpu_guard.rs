

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

enum _MemoryRegionAttribute {
    ReadOnly,
    ReadWrite,
    ReadExecutable
}

pub struct MemoryRegion {
    pub base_addr : u32,
    pub limit_addr : u32
}

impl MemoryRegion {

    pub fn new() -> Self {
        Self {
            base_addr: 0x0,
            limit_addr: 0x0
        }
    }

    pub fn create(base_addr: u32, limit_addr: u32) -> Self {
        Self {
            base_addr,
            limit_addr
        }
    }
}

///////////////////////////
// Guard Security Region //
///////////////////////////

pub enum GuardSecurityAttribute {
    Untrusted,
    Trusted,
    SemiTrusted
}

pub struct GuardSecurityRegion {
    pub memory_id: u8,
    pub memory_region : MemoryRegion,
    pub memory_security_attribute : GuardSecurityAttribute
}

impl GuardSecurityRegion {

    pub fn new() -> Self {
        Self { 
            memory_id: 0x0,
            memory_region: MemoryRegion::new(),
            memory_security_attribute: GuardSecurityAttribute::Untrusted
        }
    }

    pub fn create(memory_id: u8, memory_region: MemoryRegion, memory_security_attribute: GuardSecurityAttribute) -> Self {
        Self { 
            memory_id,
            memory_region,
            memory_security_attribute
        }
    }
}

//////////////////////////////
// CPU Security Guard Trait //
//////////////////////////////

pub trait CpuSecurityGuardTrait {

    fn cpu_guard_security_init(&mut self);
    // Create Region
    fn cpu_guard_security_region_create(&mut self, guard_security_region: & GuardSecurityRegion);
    // Delete Region
    // Destroy

}

pub trait CpuAccessGuardTrait {
    // TBD
}
