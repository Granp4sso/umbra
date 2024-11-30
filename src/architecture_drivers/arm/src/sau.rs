

// ARM Secure Attribution Unit

// Using Rust Naming conventions https://rust-lang.github.io/api-guidelines/naming.html

// Crates
use peripheral_regs::*;

//////////////////////////////////////////////////
//    ___                 _      _              //
//   |   \ ___ ___ __ _ _(_)_ __| |_ ___ _ _    //
//   | |) / -_|_-</ _| '_| | '_ \  _/ _ \ '_|   //
//   |___/\___/__/\__|_| |_| .__/\__\___/_|     //
//                         |_|                  //
//////////////////////////////////////////////////

const SAU_BASE_ADDR: u32 = 0xE000EDD0;

#[repr(C)]
struct SauRegisters {
    sau_ctrl    : u32,
    sau_type    : u32,
    sau_rnr     : u32,
    sau_rbar    : u32,
    sau_rlar    : u32,
    sau_sfsr    : u32,
    sau_sfar    : u32
}

impl SauRegisters {
    /// Creates a new instance from the base address, allowing register access
    fn new() -> &'static mut Self {
        unsafe { &mut *(SAU_BASE_ADDR as *mut Self) }
    }
}

//////////////////////////////////////////////
//     ___             _            _       //
//    / __|___ _ _  __| |_ __ _ _ _| |_ ___ //
//   | (__/ _ \ ' \(_-<  _/ _` | ' \  _(_-< //
//    \___\___/_||_/__/\__\__,_|_||_\__/__/ //
//                                          //
//////////////////////////////////////////////

//////////////////////////
// SAU Control Register //
//////////////////////////

const SAU_CTRL_REG  : u32 = 0x0;
// Lower byte is for the field starting bit, upper byte is for the length
const SAU_CTRL_ALLNS_FIELD   : u16 = 0x0101;
const SAU_CTRL_ENABLE_FIELD  : u16 = 0x0100;

///////////////////////
// SAU Type Register //
///////////////////////

const SAU_TYPE_REG  : u32 = 0x4;
const SAU_TYPE_SREGION_FIELD : u16 = 0x0800;

///////////////////////////////
// SAU Region Numer Register //
///////////////////////////////

const SAU_RNR_REG   : u32 = 0x8;
const SAU_RNR_REGION_FIELD : u16 = 0x0800;

//////////////////////////////////////
// SAU Rebion Base Address Register //
//////////////////////////////////////

const SAU_RBAR_REG  : u32 = 0xC;
const SAU_RBAR_BADDR_FIELD : u16 = 0x1B05;

//////////////////////////
// SAU Control Register //
//////////////////////////

const SAU_RLAR_REG  : u32 = 0x10;
const SAU_RLAR_LADDR_FIELD   : u16 = 0x1B05;
const SAU_RLAR_NSC_FIELD     : u16 = 0x0101;
const SAU_RLAR_ENABLE_FIELD  : u16 = 0x0100;

//////////////////////////
// SAU Control Register //
//////////////////////////

const SAU_SFSR_REG  : u32 = 0x14;
const SAU_SFSR_LSERR_FIELD       : u16 = 0x0107;
const SAU_SFSR_SFARVALID_FIELD   : u16 = 0x0106;
const SAU_SFSR_LSPERR_FIELD      : u16 = 0x0105;
const SAU_SFSR_INVTRAN_FIELD     : u16 = 0x0104;
const SAU_SFSR_AUVIOL_FIELD      : u16 = 0x0103;
const SAU_SFSR_INVER_FIELD       : u16 = 0x0102;
const SAU_SFSR_INVIS_FIELD       : u16 = 0x0101;
const SAU_SFSR_INVEP_FIELD       : u16 = 0x0100;

//////////////////////////
// SAU Control Register //
//////////////////////////

const SAU_SFAR_REG  : u32 = 0x18;

//////////////////////////////////////////////////////////////////////
//    ___            _                   _        _   _             //
//   |_ _|_ __  _ __| |___ _ __  ___ _ _| |_ __ _| |_(_)___ _ _     //
//    | || '  \| '_ \ / -_) '  \/ -_) ' \  _/ _` |  _| / _ \ ' \    //
//   |___|_|_|_| .__/_\___|_|_|_\___|_||_\__\__,_|\__|_\___/_||_|   //
//             |_|                                                  //
//////////////////////////////////////////////////////////////////////


// Main struct for the peripheral driver
pub struct SauDriver {
    regs: &'static mut SauRegisters,
}

impl SauDriver {

    // Constructor
    pub fn new() -> Self {
        let regs = SauRegisters::new();
        Self { regs }
    }

    pub unsafe fn init(&mut self) {
        // By default, SAU regions are undefined at reset, we must clear them explicitly
        let regs_base_address = self.regs as *const SauRegisters as *const u32;
        let region_num : u8 = read_register(regs_base_address, SAU_TYPE_REG) as u8;

        for i in 0..region_num {
            // First, select the region
            write_register(regs_base_address, SAU_RNR_REG, i as u32);
            // Let's clear the region enable bit
            clear_register_field(regs_base_address, SAU_RLAR_REG, SAU_RLAR_ENABLE_FIELD, 0x1);
        }
        write_register(regs_base_address, SAU_RNR_REG, 0 as u32);
    }

}


//////////////////////////////
//    _____         _ _     //
//   |_   _| _ __ _(_) |_   //
//     | || '_/ _` | |  _|  //  
//     |_||_| \__,_|_|\__|  //
//                          //
//////////////////////////////