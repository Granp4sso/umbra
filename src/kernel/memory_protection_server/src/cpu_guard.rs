

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

use memory_layout::MemoryBlock;

///////////////////////////
// Guard Security Region //
///////////////////////////

pub enum GuardSecurityAttribute {
    Untrusted,
    Trusted,
    SemiTrusted
}

pub struct GuardSecurityRegion {
    memory_id: u8,
    memory_block : MemoryBlock,
    memory_security_attribute : GuardSecurityAttribute
}

impl GuardSecurityRegion {
    // Constructor with default values
    pub fn new() -> Self {
        Self {
            memory_id: 0x0,
            memory_block: MemoryBlock::new(),
            memory_security_attribute: GuardSecurityAttribute::Untrusted,
        }
    }

    // Constructor with custom values
    pub fn create(
        memory_id: u8,
        memory_block: MemoryBlock,
        memory_security_attribute: GuardSecurityAttribute,
    ) -> Self {
        Self {
            memory_id,
            memory_block,
            memory_security_attribute,
        }
    }

    // Getter for memory_id
    pub fn get_memory_id(&self) -> u8 {
        self.memory_id
    }

    // Setter for memory_id
    pub fn set_memory_id(&mut self, memory_id: u8) {
        self.memory_id = memory_id;
    }

    // Getter for memory_block
    pub fn get_memory_block(&self) -> &MemoryBlock {
        &self.memory_block
    }

    // Setter for memory_block
    pub fn set_memory_block(&mut self, memory_block: MemoryBlock) {
        self.memory_block = memory_block;
    }

    pub fn set_memory_block_from_range(&mut self, base_addr: u32, limit_addr: u32) {
        self.set_memory_block(MemoryBlock::create_from_range(base_addr, limit_addr)); 
    }

    // Getter for memory_security_attribute
    pub fn get_memory_security_attribute(&self) -> &GuardSecurityAttribute {
        &self.memory_security_attribute
    }

    // Setter for memory_security_attribute
    pub fn set_memory_security_attribute(&mut self, memory_security_attribute: GuardSecurityAttribute) {
        self.memory_security_attribute = memory_security_attribute;
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
