.global _start
_start:
mov $stack_top, %rsp
call kernel_main
hang:
    hlt
    jump hang

.section .bss
.stack_top_label:
    .space 8192
stack
