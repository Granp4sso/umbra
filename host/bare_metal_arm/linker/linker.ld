/* Author: Stefano Mercogliano <stefano.mercogliano@unina.it>*/
MEMORY
{
    SECURE_FLASH        (RXAL)  : ORIGIN = 0x08000000,                                      LENGTH = 256K,
    NON_SECURE_FLASH    (RX)    : ORIGIN = ORIGIN(SECURE_FLASH) + LENGTH(SECURE_FLASH),     LENGTH = 256K,
    SRAM1               (RWX)   : ORIGIN = 0x20000000,                                      LENGTH = 192K,
    SRAM2               (RWX)   : ORIGIN = ORIGIN(SRAM1) + LENGTH(SRAM1),                   LENGTH = 64K
}

INCLUDE /home/stefano/Desktop/Work/Projects/umbra/src/kernel/linker/umbra.ld

/* Peripherals symbols */
_host_stack_size = 0x1000;

/* Sections */
SECTIONS
{
	/* .ns_fn section at a fixed address within FLASH */
    ._host_vector_table : 
    {
        KEEP(*(._host_vectors))

    } > NON_SECURE_FLASH

    ._host_handlers :
    {
        KEEP(*(._host_handlers))
    } > NON_SECURE_FLASH

    ._host_text : 
    {
        KEEP(*(.text))
		KEEP(*(.text.*))
    } > NON_SECURE_FLASH

    ._host_stack (NOLOAD):
    {
        _host_sstack = _host_estack - _host_stack_size;
        . = _host_sstack;
        . += _host_stack_size;
        _host_estack = ORIGIN(SRAM1) + LENGTH(SRAM1);
    } > SRAM1
}

