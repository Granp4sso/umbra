

// STM32L5xxx Global TrustZone Controller

// Using Rust Naming conventions https://rust-lang.github.io/api-guidelines/naming.html
// Documentation is the STM32L552xx and STM32L562xx advanced Arm-based 32-bit MCUs rewference manual

//
// The Global TrustZone Controller enables the configuration of TrustZone security for programmable-security
// bus agents, such as on-chip RAM with secure blocks, AHB/APB peripherals with secure/privilege access,
// secure AHB masters, and off-chip memories with secure areas.
// 
// it includes the following three components, 
// 
// TZSC (TrustZone® Security Controller):
// 	    Manages the secure/privilege state of peripherals and controls the non-secure area size
// 	    for the watermark memory peripheral controller (MPCWM). It communicates secure statuses
// 	    to peripherals like RCC and GPIOs.
// 
// MPCBB (Block-Based Memory Protection Controller):
// 	    Regulates the secure states of 256-byte blocks within SRAM.
// 
// TZIC (TrustZone® Illegal Access Controller):
// 	    Monitors and reports illegal access events by generating secure interrupts to the NVIC.
//


// Crates
use peripheral_regs::*;

//////////////////////////////////////////////////
//    ___                 _      _              //
//   |   \ ___ ___ __ _ _(_)_ __| |_ ___ _ _    //
//   | |) / -_|_-</ _| '_| | '_ \  _/ _ \ '_|   //
//   |___/\___/__/\__|_| |_| .__/\__\___/_|     //
//                         |_|                  //
//////////////////////////////////////////////////

const GTZC_BASE_ADDR: u32 = 0x40032400;

#[repr(C)]
struct GtzcRegisters {
    gtzc_base_addr : u32
}

impl GtzcRegisters {
    /// Creates a new instance from the base address, allowing register access
    fn new() -> &'static mut Self {
        unsafe { &mut *(GTZC_BASE_ADDR as *mut Self) }
    }
}

//////////////////////////////////////////////
//     ___             _            _       //
//    / __|___ _ _  __| |_ __ _ _ _| |_ ___ //
//   | (__/ _ \ ' \(_-<  _/ _` | ' \  _(_-< //
//    \___\___/_||_/__/\__\__,_|_||_\__/__/ //
//                                          //
//////////////////////////////////////////////

///////////////////////////////////
// TrustZone Security Controller //
///////////////////////////////////

// TBD

//////////////////////////////////////////////
// Block-based Memory Protection Controller //
//////////////////////////////////////////////

const GTZC_MPCBB1_BASE_ADDR : u32 = GTZC_BASE_ADDR + 0x800;
const GTZC_MPCBB2_BASE_ADDR : u32 = GTZC_BASE_ADDR + 0xC00;

// Memory Protection Controller 1/2 - Control Register
const _GTZC_MPCBB_CR_REG                 : u32 = 0x000;
const _GTZC_MPCBB_CR_LCK_FIELD           : u16 = 0x0100;
const _GTZC_MPCBB_CR_INVSECSTATE_FIELD   : u16 = 0x011e;
const _GTZC_MPCBB_CR_SRWILADIS           : u16 = 0x011f;
// Memory Protection Controller 1/2 - Lock Register
const _GTZC_MPCBB_LCKVTR1_REG            : u32 = 0x010;
// Memory Protection Controller 1/2 - Vector Register
const GTZC_MPCBB_VCTR_Y_REG             : u32 = 0x100;

/////////////////////////////////////////////
// TrustZone Security Interrupt Controller //
/////////////////////////////////////////////

// TBD


//////////////////////////////////////////////////////////////////////
//    ___            _                   _        _   _             //
//   |_ _|_ __  _ __| |___ _ __  ___ _ _| |_ __ _| |_(_)___ _ _     //
//    | || '  \| '_ \ / -_) '  \/ -_) ' \  _/ _` |  _| / _ \ ' \    //
//   |___|_|_|_| .__/_\___|_|_|_\___|_||_\__\__,_|\__|_\___/_||_|   //
//             |_|                                                  //
//////////////////////////////////////////////////////////////////////


/////////////////////////// 
// GTZC Peripheral Driver //
///////////////////////////

pub struct GtzcDriver {
    regs: &'static mut GtzcRegisters,
}

impl GtzcDriver {

    // Constructor
    pub fn new() -> Self {
        let regs = GtzcRegisters::new();
        Self { regs }
    }

    // The MPCBB sees memory as organized in blocks.
    // A block is 256 Bytes in size, A superblock is 256x32 = 8KB
    // SRAM1 is made of 192/8=24 super blocks, while SRAM2 has 8 superblocks

    pub unsafe fn set_memory_bank_security( &mut self, memory_bank_id : u8, secure_flag: u8 ) {

        // Disclaimer: SRAM sizes are hardcoded atm, they shall be taken from the linker script symbol
        let sram1_size : u32 = 24; 
        let sram2_size : u32 = 8; 

        let curr_bank_size = if memory_bank_id == 0 {sram1_size} else {sram2_size};

        for i in 0..curr_bank_size {
            self.set_memory_superblock_security(memory_bank_id, i as u8, secure_flag );
        }
    }

    pub unsafe fn set_memory_superblock_security( &mut self, memory_bank_id : u8, super_block_id : u8, secure_flag: u8 ) {
        
        let regs_base_address = self.regs as *const GtzcRegisters as *const u32;

        let mut block_reg_offset = GTZC_MPCBB_VCTR_Y_REG + (super_block_id as u32)*4;

        if memory_bank_id == 0 {
            block_reg_offset += GTZC_MPCBB1_BASE_ADDR;
        } else {
            block_reg_offset += GTZC_MPCBB2_BASE_ADDR;
        }

        let secure_data = if secure_flag == 0 {0x00000000} else {0xffffffff};
        write_register(regs_base_address, block_reg_offset, secure_data);

    }

    // This function sets block X in superblock Y security attribute
    pub unsafe fn set_memory_block_security( &mut self, memory_bank_id : u8, super_block_id : u8, block_id : u8, secure_flag: u8 ) {

        let regs_base_address = self.regs as *const GtzcRegisters as *const u32;

        let mut block_reg_offset = GTZC_MPCBB_VCTR_Y_REG + (super_block_id as u32)*4;

        if memory_bank_id == 0 {
            block_reg_offset += GTZC_MPCBB1_BASE_ADDR;
        } else {
            block_reg_offset += GTZC_MPCBB2_BASE_ADDR;
        }

        let block_bitmask = 1 << block_id;

        if secure_flag == 0 {
            clear_register_field(regs_base_address, block_reg_offset, 0x1f00, block_bitmask);
        } else {
            set_register_field(regs_base_address, block_reg_offset, 0x1f00, block_bitmask);
        }

    }

}


//////////////////////////////
//    _____         _ _     //
//   |_   _| _ __ _(_) |_   //
//     | || '_/ _` | |  _|  //  
//     |_||_| \__,_|_|\__|  //
//                          //
//////////////////////////////