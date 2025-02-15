
//////////////////////////////////////////////////////////////////////////////////////
//                                                                                  //
// Author: Stefano Mercogliano <stefano.mercogliano@unina.it>                       //
// Description:                                                                     //
//      TBD
//                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////

use core::arch::global_asm;

global_asm!(
    "
    .section .umbra_nsc_api, \"a\"
    "
);

#[cfg(all(target_arch = "arm", target_os = "none"))]
extern "C" {
    pub fn umbra_enclave_run();
}
#[cfg(all(target_arch = "arm", target_os = "none"))]
global_asm!(
    "
    .global umbra_enclave_run 
    .extern umbra_enclave_run_imp    

    umbra_enclave_run:
        sg
        bl umbra_enclave_run_imp

    "
);

////////////////////////////////////////////////////////

global_asm!(
    "
    .section .umbra_api_implementation, \"a\"
    "
);

#[no_mangle]
pub fn umbra_enclave_run_imp(){

    let x = 128;
    let _y = x + 12;

    loop {}
}







