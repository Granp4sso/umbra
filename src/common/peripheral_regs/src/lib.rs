
#![crate_name = "peripheral_regs"]
#![crate_type = "rlib"]
#![no_std]

use core::ptr;

pub unsafe fn read_register(regs_base_address: *const u32, reg_offset: u32) -> u32 {
    let regs_base_address_u = regs_base_address as u32;
    let value = ptr::read_volatile((regs_base_address_u + reg_offset) as *const u32);
    return value;
}

pub unsafe fn write_register(regs_base_address: *const u32, reg_offset: u32, value: u32) {
    let regs_base_address_u = regs_base_address as u32;
    ptr::write_volatile((regs_base_address_u + reg_offset) as *mut u32, value);
}

pub unsafe fn set_register_bit(regs_base_address: *const u32, reg_offset: u32, bit: u8) {
    let reg_val = read_register(regs_base_address, reg_offset);
    write_register(regs_base_address, reg_offset, reg_val | (1 << bit));
}

pub unsafe fn clear_register_bit(regs_base_address: *const u32, reg_offset: u32, bit: u8) {
    let reg_val = read_register(regs_base_address, reg_offset);
    write_register(regs_base_address, reg_offset, reg_val & !(1 << bit));
}

pub unsafe fn set_register_field(regs_base_address: *const u32, reg_offset: u32, val: u16, mask: u32) {

    let field_size = val >> 8;
    let field_start = val & 0x00ff;

    for field_cnt in 0..field_size {
        if ((mask >> field_cnt) & 0x1) == 1 {
            let curr_bit = (field_start + field_cnt) as u8;
            set_register_bit(regs_base_address, reg_offset, curr_bit);
        }
    }
}

pub unsafe fn clear_register_field(regs_base_address: *const u32, reg_offset: u32, val: u16, mask: u32) {
    
    let field_size = val >> 8;
    let field_start = val & 0x00ff;

    for field_cnt in 0..field_size {
        if ((mask >> field_cnt) & 0x1) == 1 {
            let curr_bit = (field_start + field_cnt) as u8;
            clear_register_bit(regs_base_address, reg_offset, curr_bit);
        }
    }
}