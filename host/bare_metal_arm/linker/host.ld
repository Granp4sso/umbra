/*********************************************************************************************************
*
*   Author: Stefano Mercogliano <stefano.mercogliano@unina.it>
*   Notes:
*       This host example file defines memory blocks and host data structures and sections.
*       In general, this linker script is assumed to be a vanilla one, that originally did not include Umbra.
*       A minor modification is required to define memory region block aliases that umbra linkers will use.
*   
**********************************************************************************************************/

/* Including memory blocks definitions */
INCLUDE /home/stefano/Desktop/Work/Projects/umbra/host/bare_metal_arm/linker/memory.ld

/* Including umbra linker script */
INCLUDE /home/stefano/Desktop/Work/Projects/umbra/src/kernel/linker/umbra.ld

/*******************
*   Host Sections  *
********************/

/* Peripherals symbols */
_host_stack_size = 0x1000;

/* Sections */
SECTIONS
{
	/* .ns_fn section at a fixed address within FLASH */
    ._host_vector_table : 
    {
        KEEP(*(._host_vectors))

    } > FLASH_BANK_1

    ._host_handlers :
    {
        KEEP(*(._host_handlers))
    } > FLASH_BANK_1

    ._host_text : 
    {
        KEEP(*(.text))
		KEEP(*(.text.*))
    } > FLASH_BANK_1

    ._host_stack (NOLOAD):
    {
        _host_sstack = _host_estack - _host_stack_size;
        . = _host_sstack;
        . += _host_stack_size;
        _host_estack = ORIGIN(SRAM_0) + LENGTH(SRAM_0);
    } > SRAM_0
}

