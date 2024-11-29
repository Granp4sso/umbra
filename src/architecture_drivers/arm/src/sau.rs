

// ARM Secure Attribution Unit

// Using Rust Naming conventions https://rust-lang.github.io/api-guidelines/naming.html

use core::ptr;

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

    // Register operations
    pub unsafe fn read_register(&self, reg_offset: u32) -> u32 {
        let regs_base_address = self.regs as *const SauRegisters as u32;
        let value = ptr::read_volatile((regs_base_address + reg_offset) as *const u32);
        return value;
    }

    pub unsafe fn write_register(&mut self, reg_offset: u32, value: u32) {
        let regs_base_address = self.regs as *const SauRegisters as u32;
        ptr::write_volatile((regs_base_address + reg_offset) as *mut u32, value);
    }
    
    pub unsafe fn set_register_bit(&mut self, reg_offset: u32, bit: u8) {
        let reg_val = self.read_register(reg_offset);
        self.write_register(reg_offset, reg_val | (1 << bit));
    }
    
    pub unsafe fn clear_register_bit(&mut self, reg_offset: u32, bit: u8) {
        let reg_val = self.read_register(reg_offset);
        self.write_register(reg_offset, reg_val & !(1 << bit));
    }

    pub unsafe fn set_register_field(&mut self, reg_offset: u32, val: u16, mask: u32) {

        let field_size = val >> 8;
        let field_start = val & 0x00ff;

        for field_cnt in 0..field_size {
            if ((mask >> field_cnt) & 0x1) == 1 {
                let curr_bit = (field_start + field_cnt) as u8;
                self.set_register_bit(reg_offset, curr_bit);
            }
        }
    }

    pub unsafe fn clear_register_field(&mut self, reg_offset: u32, val: u16, mask: u32) {
        
        let field_size = val >> 8;
        let field_start = val & 0x00ff;

        for field_cnt in 0..field_size {
            if ((mask >> field_cnt) & 0x1) == 1 {
                let curr_bit = (field_start + field_cnt) as u8;
                self.clear_register_bit(reg_offset, curr_bit);
            }
        }
    }

    // Driver Operations
    pub unsafe fn init(&mut self) {
        // By default, SAU regions are undefined at reset, we must clear them explicitly
        let region_num : u8 = self.read_register(SAU_TYPE_REG) as u8;
        for i in 0..region_num {
            // First, select the region
            self.write_register(SAU_RNR_REG, i as u32);
            // Let's clear the region enable bit
            self.clear_register_field(SAU_RLAR_REG, SAU_RLAR_ENABLE_FIELD, 0xffffffff);
        }
        self.write_register(SAU_RNR_REG, 0 as u32);
    }

    /*
    /// Initializes the peripheral with a given configuration
    ///
    /// # Arguments
    /// * `config` - A PeripheralConfig enum specifying the mode of operation
    pub fn initialize(&mut self, config: PeripheralConfig) {
        // Configure the peripheral based on the provided mode
        match config {
            PeripheralConfig::Mode1 => {
                self.regs.reg1 = 0x01;
                self.regs.reg2 = 0x02;
            }
            PeripheralConfig::Mode2 => {
                self.regs.reg1 = 0x10;
                self.regs.reg2 = 0x20;
            }
        }
        
        // Example of an optional delay (for hardware setup timing, if needed)
        self.delay(100);
    }

    /// Writes a value to a specific register
    pub fn write_register(&mut self, reg_offset: u32, value: u32) {
        unsafe { ptr::write_volatile((PERIPHERAL_BASE + reg_offset) as *mut u32, value) };
    }

    /// Set a specific bit in a register
    pub fn set_bit(&mut self, reg_offset: u32, bit: u8) {
        let reg_val = self.read_register(reg_offset);
        self.write_register(reg_offset, reg_val | (1 << bit));
    }

    /// Clear a specific bit in a register
    pub fn clear_bit(&mut self, reg_offset: u32, bit: u8) {
        let reg_val = self.read_register(reg_offset);
        self.write_register(reg_offset, reg_val & !(1 << bit));
    }

    /// Example method to perform a peripheral-specific operation
    pub fn do_something(&mut self) {
        // Example: Toggle a bit in register 1
        self.set_bit(REGISTER_1_OFFSET, 3);
    }

    /// Optional internal delay function (simple busy-wait)
    ///
    /// This delay function introduces a basic busy-wait loop for small delays
    fn delay(&self, cycles: u32) {
        for _ in 0..cycles {
            // Busy-wait to simulate a delay (NOP)
            core::sync::atomic::compiler_fence(core::sync::atomic::Ordering::SeqCst);
        }
    }
    */
}


//////////////////////////////
//    _____         _ _     //
//   |_   _| _ __ _(_) |_   //
//     | || '_/ _` | |  _|  //  
//     |_||_| \__,_|_|\__|  //
//                          //
//////////////////////////////