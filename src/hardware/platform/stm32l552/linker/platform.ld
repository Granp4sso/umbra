/*********************************************************************************************************
*
*   Author: Stefano Mercogliano <stefano.mercogliano@unina.it>
*   Notes:
*       Secure Flash and Non Secure Flash can be statically defined on stm32lxxx-based boards.
*       Currently, we assume the first bank on stm32l552 to be secure, and the second to be non-secure.
*       Watermatking could also be included in the bootloader, or statically defined at a finer level
*       Than bank (e.g. pages). 
*
**********************************************************************************************************/

MEMORY
{
    SECURE_FLASH        (RXAL)  : ORIGIN = 0x08000000,                                      LENGTH = 256K,
    NON_SECURE_FLASH    (RX)    : ORIGIN = ORIGIN(SECURE_FLASH) + LENGTH(SECURE_FLASH),     LENGTH = 256K,
    SRAM1               (RWX)   : ORIGIN = 0x20000000,                                      LENGTH = 192K,
    SRAM2               (RWX)   : ORIGIN = ORIGIN(SRAM1) + LENGTH(SRAM1),                   LENGTH = 64K
}

_umb_stack_size = 0x1000;
_host_stack_size = 0x1000;

ENTRY(_umb_vector_table);

/* Define the sections */
SECTIONS
{
    /************************************
    *      ___                          *
    *     / __| ___ __ _  _ _ _ ___     *
    *     \__ \/ -_) _| || | '_/ -_)    *
    *     |___/\___\__|\_,_|_| \___|    *
    *                                   *
    ************************************/

    /********************
    * Secure Boot Area  *
    *********************/
    /* 
    *  Umbra first part of code contains the vector tables and the handlers
    */
    ._umb_vector_table :
    {
        KEEP(*(._umb_vectors))
    } > SECURE_FLASH

    ._umb_handlers :
    {
        KEEP(*(._umb_handlers))
    } > SECURE_FLASH

    /* .text section in FLASH, with .start input section */
    ._umb_startup :
    {
        KEEP(*(.text._umb_start));  /* Ensure .start section is kept in .text */
        KEEP(*(.text.main));  
        
    } > SECURE_FLASH

    /********************
    * Secure Functions  *
    *********************/

    .secure :
    {
        KEEP(*(.text.secure));  
        
    } > SECURE_FLASH

    /***********************
    * Non-Secure Callable  *
    ************************/

    .text :
    {
        *(.text*);
       
    } > SECURE_FLASH

    .rodata :
    {
        *(.rodata*)
    } > SECURE_FLASH

    /* Other sections (e.g., .data and .bss) can go in RAM */
    .data (NOLOAD): 
    {
        *(.data*)
    } > SRAM2
    
    .bss (NOLOAD): 
    {
        *(.bss*)
    } > SRAM2

    ._umb_stack (NOLOAD):
    {
        _umb_sstack = _umb_estack - _umb_stack_size;
        . = _umb_sstack;
        . += _umb_stack_size;
        _umb_estack = ORIGIN(SRAM2) + LENGTH(SRAM2);
    } > SRAM2

    /****************************************************
    *      _  _             ___                         *
    *     | \| |___ _ _ ___/ __| ___ __ _  _ _ _ ___    *
    *     | .` / _ \ ' \___\__ \/ -_) _| || | '_/ -_)   *
    *     |_|\_\___/_||_|  |___/\___\__|\_,_|_| \___|   *
    *      / __|__ _| | |__ _| |__| |___                *
    *     | (__/ _` | | / _` | '_ \ / -_)               *
    *      \___\__,_|_|_\__,_|_.__/_\___|               *
    *                                                   *
    ****************************************************/

    .nsc 0x08030000 : 
    {
        . = ALIGN(32);
        KEEP(*(.nsc));  
    } > SECURE_FLASH

    /****************************************************
    *      _  _            ___                          *
    *     | \| |___ _ _   / __| ___ __ _  _ _ _ ___     *
    *     | .` / _ \ ' \  \__ \/ -_) _| || | '_/ -_)    *
    *     |_|\_\___/_||_| |___/\___\__|\_,_|_| \___|    *
    *                                                   *
    ****************************************************/

    /* .ns_fn section at a fixed address within FLASH */
    ._host_vector_table : 
    {
        KEEP(*(._host_vectors))

    } > NON_SECURE_FLASH

    ._host_host_handlers :
    {
        KEEP(*(._host_handlers))
    } > NON_SECURE_FLASH

    ._host_text : 
    {
        KEEP(*(._host_start))
        KEEP(*(.ns))
    } > NON_SECURE_FLASH

    ._host_stack (NOLOAD):
    {
        _host_sstack = _host_estack - _host_stack_size;
        . = _host_sstack;
        . += _host_stack_size;
        _host_estack = ORIGIN(SRAM1) + LENGTH(SRAM1);
    } > SRAM1



}


