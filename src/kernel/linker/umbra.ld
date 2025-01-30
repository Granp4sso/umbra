/*********************************************************************************************************
*
*   Author: Stefano Mercogliano <stefano.mercogliano@unina.it>
*   Description:
*       TBD
*
**********************************************************************************************************/


_umb_stack_size = 0x1000;

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
    ._umb_test :
    {
        KEEP(*(.text.umbra_test_0))
        KEEP(*(.text.umbra_test_1))
        KEEP(*(.text.umbra_test_2))
    } > _SECURE_TEXT_MEMORY_
}