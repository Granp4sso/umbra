//////////////////////////////////////////////////////////////////////////////////////
//    __  __                                   _                            _       //
//   |  \/  | ___ _ __ ___   ___  _ __ _   _  | |    __ _ _   _  ___  _   _| |_     //
//   | |\/| |/ _ \ '_ ` _ \ / _ \| '__| | | | | |   / _` | | | |/ _ \| | | | __|    //
//   | |  | |  __/ | | | | | (_) | |  | |_| | | |__| (_| | |_| | (_) | |_| | |_     //
//   |_|  |_|\___|_| |_| |_|\___/|_|   \__, | |_____\__,_|\__, |\___/ \__,_|\__|    //
//                                     |___/              |___/                     //
//                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>                   //
//                                                                              //
// Description:                                                                 //    
//      
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

#![crate_name = "memory_layout"]
#![crate_type = "rlib"]
#![no_std]

pub const MEMORY_BLOCK_SIZE: u32 = 256;

pub enum _MemoryBlockAttribute {
    ReadOnly,
    ReadWrite,
    ReadExecutable
}

pub struct MemoryBlock {
    block_base_id: u32,
    block_num: u32,
}

impl MemoryBlock {
    // Constructor for default values
    pub fn new() -> Self {
        Self {
            block_base_id: 0x0,
            block_num: 0x0,
        }
    }

    // Constructor for custom values
    pub fn create(block_base_id: u32, block_num: u32) -> Self {
        Self {
            block_base_id,
            block_num,
        }
    }

    pub fn create_from_range(base_addr: u32, limit_addr: u32) -> Self {
        let block_base_id = base_addr/MEMORY_BLOCK_SIZE as u32;
        let mut block_num = (limit_addr - base_addr)/MEMORY_BLOCK_SIZE as u32;

        // Check if the block_num must be ceiled or not
        if limit_addr & 0x000000ff != 0 {
            block_num += 1;
        }

        Self {
            block_base_id,
            block_num,
        }
    }

    /////////////////////////
    // Addresses to Blocks //
    /////////////////////////

    pub fn set_block_size(&mut self, base_addr: u32, limit_addr: u32) {
        self.block_base_id = base_addr/MEMORY_BLOCK_SIZE;
        let mut block_num = (limit_addr - base_addr)/MEMORY_BLOCK_SIZE as u32;

        // Check if the block_num must be ceiled or not
        if limit_addr & 0x000000ff != 0 {
            block_num += 1;
        }

        self.block_num = block_num;
    }

    //////////////////////
    // Getter & Setters //
    //////////////////////

    // Getter for block_base_id
    pub fn get_block_base_id(&self) -> u32 {
        self.block_base_id
    }

    // Setter for block_base_id
    pub fn set_block_base_id(&mut self, block_base_id: u32) {
        self.block_base_id = block_base_id;
    }

    // Getter for block_num
    pub fn get_block_num(&self) -> u32 {
        self.block_num
    }

    // Setter for block_num
    pub fn set_block_num(&mut self, block_num: u32) {
        self.block_num = block_num;
    }
}
