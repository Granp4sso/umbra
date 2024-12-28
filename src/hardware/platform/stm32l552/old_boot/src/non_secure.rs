use core::arch::global_asm;

use crate::non_secure_callable::nsc_fn;

// Host example startup code
#[cfg(all(target_arch = "arm", target_os = "none"))]
extern "C" {
    pub fn _host_start();
}
#[cfg(all(target_arch = "arm", target_os = "none"))]
global_asm!(
    "
    .global _host_start                 // Define the entry point
    .global _host_Reset_Handler         // Main reset handler
    .global _host_Default_Handler       // Default handler for undefined interrupts
    .extern _host_estack
    
    .section ._host_start
    
    _host_start:
        nop
        nop
        bl ns_fn                         // stop here
        b  .
    
    // Vector Table Section
    .section ._host_vectors, \"a\"      // Marked as 'a' for allocation in memory
    
        .word _host_estack              // Initial stack pointer
        .word _host_Reset_Handler       // Reset vector
        .word _host_NMI_Handler         // Non-maskable interrupt handler
        .word _host_HardFault_Handler   // Hard Fault handler
        .word _host_MemManage_Handler   // Memory Management fault handler
        .word _host_BusFault_Handler    // Bus Fault handler
        .word _host_UsageFault_Handler  // Usage Fault handler
        .word 0                         // Reserved
        .word 0                         // Reserved
        .word 0                         // Reserved
        .word 0                         // Reserved
        .word _host_SVC_Handler         // SVCall handler
        .word _host_DebugMon_Handler    // Debug Monitor handler
        .word 0                         // Reserved
        .word _host_PendSV_Handler      // PendSV handler
        .word _host_SysTick_Handler     // SysTick handler
    
    // Define Handlers for exceptions
    .section ._host_handlers, \"a\"
    _host_Reset_Handler:
        ldr sp, =_host_estack           // Load the stack pointer with the address of the top of the stack
        // Here he need to setup the vector table base address
        bl _host_start                  // Call main (Rust function, typically defined in main.rs)
    
    _host_Default_Handler:
        b .                     // Infinite loop (hangs here if an undefined interrupt occurs)
    
    // Basic Handlers (redirect to Default_Handler if not defined)
    _host_NMI_Handler:          b _host_Default_Handler
    _host_HardFault_Handler:    b _host_Default_Handler
    _host_MemManage_Handler:    b _host_Default_Handler
    _host_BusFault_Handler:     b _host_Default_Handler
    _host_UsageFault_Handler:   b _host_Default_Handler
    _host_SVC_Handler:          b _host_Default_Handler
    _host_DebugMon_Handler:     b _host_Default_Handler
    _host_PendSV_Handler:       b _host_Default_Handler
    _host_SysTick_Handler:      b _host_Default_Handler

    "
);

#[no_mangle]
#[allow(unreachable_code)]
#[link_section=".ns"]
pub unsafe fn ns_fn() -> !{

    // Go to non-secure callable
    nsc_fn();
    
    loop {}

}

