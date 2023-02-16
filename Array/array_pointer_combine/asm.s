.section .rodata
     msg_main_print1:
    .string "arr = %-10d \t *arr =  %-10d \t &arr = %-10d\n"

    msg_main_print2:
    .string "p   = %-10d \t *p   =  %-10d \t **p  = %-10d\n"

    msg_main_print3:
    .string "ptr = %-10d \t *ptr =  %-10d \t **ptr = %-10d\n"

    msg_main_print4:
    .string  "ptr - p = %d \t  *ptr - arr = %d\t **ptr = %d\n"

.section .text
.globl  main
.type main,@function
main:

pushl   %ebp
movl    %esp,%ebp

andl    $-16,%esp

subl    $64,%esp

movl    $10,-20(%ebp)
movl    $20,-16(%ebp)
movl    $30,-12(%ebp)
movl    $40,-8(%ebp)
movl    $50,-4(%ebp)

leal    -20(%ebp),%ebx
movl    %ebx,-40(%ebp) # arr
addl    $4,%ebx
movl    %ebx,-36(%ebp) # arr +1
addl    $4,%ebx
movl    %ebx,-32(%ebp) # arr +2
addl    $4,%ebx
movl    %ebx,-28(%ebp) # arr +3
addl    $4,%ebx
movl    %ebx,-24(%ebp)  # arr+4

leal    -40(%ebp),%ebx
movl    %ebx,-44(%ebp)

leal    -20(%ebp),%ebx
movl    $0,%eax
movl    (%ebx,%eax,4),%eax
movl    $msg_main_print1,(%esp)
movl    %ebx,4(%esp)
movl    %eax,8(%esp)
movl    %ebx,12(%esp)
call    printf


leal    -40(%ebp),%ebx
movl    $0,%eax
movl   (%ebx,%eax,4),%eax
movl    (%eax),%edx
movl    $msg_main_print2,(%esp)
movl    %ebx,4(%esp)
movl    %eax,8(%esp)
movl    %edx,12(%esp)
call    printf


movl    -44(%ebp),%ebx
movl    (%ebx),%eax
movl    (%eax),%ecx
movl    $msg_main_print3,(%esp)
movl    %ebx,4(%esp)
movl    %eax,8(%esp)
movl    %ecx,12(%esp)
call    printf


movl    -44(%ebp),%ebx
addl    $4,%ebx
movl    %ebx,-44(%ebp)
movl    %ebx,%eax


leal    -40(%ebp),%edx
subl    %edx,%eax

xorl    %edx,%edx
xorl    %ecx,%ecx

movl    $4,%ecx
divl    %ecx
movl    %eax,4(%esp)

movl    -44(%ebp),%ebx
movl    (%ebx),%eax
leal   -20(%ebp),%edx
subl    %edx,%eax

xorl    %edx,%edx
xorl    %ecx,%ecx

movl    $4,%ecx
divl    %ecx
movl    %eax,8(%esp)

movl    -44(%ebp),%ebx
movl    (%ebx),%ebx
movl    (%ebx),%eax

movl    %eax,12(%esp)

movl   $msg_main_print4,(%esp)
call    printf



movl    -44(%ebp),%ebx
addl    $4,%ebx
movl    %ebx,-44(%ebp)
movl    %ebx,%eax


leal    -40(%ebp),%edx
subl    %edx,%eax

xorl    %edx,%edx
xorl    %ecx,%ecx

movl    $4,%ecx
divl    %ecx
movl    %eax,4(%esp)

movl    -44(%ebp),%ebx
movl    (%ebx),%eax
leal   -20(%ebp),%edx
subl    %edx,%eax

xorl    %edx,%edx
xorl    %ecx,%ecx

movl    $4,%ecx
divl    %ecx
movl    %eax,8(%esp)

movl    -44(%ebp),%ebx
movl    (%ebx),%ebx
movl    (%ebx),%eax

movl    %eax,12(%esp)

movl   $msg_main_print4,(%esp)
call    printf

movl    -44(%ebp),%ebx
addl    $4,(%ebx)

movl    -44(%ebp),%eax


leal    -40(%ebp),%edx
subl    %edx,%eax

xorl    %edx,%edx
xorl    %ecx,%ecx

movl    $4,%ecx
divl    %ecx
movl    %eax,4(%esp)

movl    -44(%ebp),%ebx
movl    (%ebx),%eax
leal   -20(%ebp),%edx
subl    %edx,%eax

xorl    %edx,%edx
xorl    %ecx,%ecx

movl    $4,%ecx
divl    %ecx
movl    %eax,8(%esp)

movl    -44(%ebp),%ebx
movl    (%ebx),%ebx
movl    (%ebx),%eax

movl    %eax,12(%esp)

movl   $msg_main_print4,(%esp)
call    printf







pushl   $0
call    exit







