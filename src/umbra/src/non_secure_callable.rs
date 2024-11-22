use core::arch::global_asm;

use crate::s_fn;

#[cfg(all(target_arch = "arm", target_os = "none"))]
extern "C" {
    pub fn nsc_fn();
}
#[cfg(all(target_arch = "arm", target_os = "none"))]
global_asm!(
    "
    .section .nsc, \"a\"
    .global nsc_fn
    .extern s_fn         

    nsc_fn:
        sg
        bl s_fn

    "
);