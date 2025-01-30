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

/* Including memory blocks definitions */
INCLUDE /home/stefano/Desktop/Work/Projects/umbra/host/bare_metal_arm/linker/memory.ld

/* Including umbra linker script */
INCLUDE /home/stefano/Desktop/Work/Projects/umbra/src/kernel/linker/umbra.ld

_umb_stack_size = 0x1000;

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
    } > _SECURE_TEXT_MEMORY_

    ._umb_handlers :
    {
        KEEP(*(._umb_handlers))
    } > _SECURE_TEXT_MEMORY_

    /* .text section in FLASH, with .start input section */
    ._umb_startup :
    {
        KEEP(*(.text._umb_start));  /* Ensure .start section is kept in .text */
        KEEP(*(.text.main));  
        
    } > _SECURE_TEXT_MEMORY_

    /********************
    * Secure Functions  *
    *********************/

    .secure :
    {
        KEEP(*(.text.secure));  
        
    } > _SECURE_TEXT_MEMORY_

    /***********************
    * Non-Secure Callable  *
    ************************/

    .text :
    {
        *(.text*);
       
    } > _SECURE_TEXT_MEMORY_

    .rodata :
    {
        *(.rodata*)
    } > _SECURE_TEXT_MEMORY_

    /* Other sections (e.g., .data and .bss) can go in RAM */
    .data (NOLOAD): 
    {
        *(.data*)
    } > _SECURE_DATA_MEMORY_
    
    .bss (NOLOAD): 
    {
        *(.bss*)
    } > _SECURE_DATA_MEMORY_

    ._umb_stack (NOLOAD):
    {
        _umb_sstack = _umb_estack - _umb_stack_size;
        . = _umb_sstack;
        . += _umb_stack_size;
        _umb_estack = ORIGIN(_SECURE_DATA_MEMORY_) + LENGTH(_SECURE_DATA_MEMORY_);
    } > _SECURE_DATA_MEMORY_

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
    } > _SECURE_TEXT_MEMORY_

}
