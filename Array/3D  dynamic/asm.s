.equ NULL,0
.section .rodata
    msg_main_print_enter_of_row_column_plane_value:
    .string "Enter values of planes,rows, colums\n"

    msg_main_scan_row_column_plane_value:
    .string "%d%d%d"

    msg_main_print_enter_value:
    .string "Enter [%d][%d][%d] value\t"

    msg_main_scan_enter_value:
    .string "%d"

    msg_main_print_entered_value:
    .string "Entered elements are\n"

    msg_main_print_value:
    .string "[%d][%d][%d] value is \t%d\n"

   msg_main_print_malloc_failed:
    .string "Memory Allocation Failed\n" 

    msg_main_print:
    .string "%d %d %d"

.section .text
.globl main
.type main,@function

main:

    pushl   %ebp
    movl    %esp,%ebp

    andl    $-16,%esp

    subl    $48,%esp

    movl    $NULL,28(%ebp)


    movl    $msg_main_print_enter_of_row_column_plane_value,(%esp)
    call    printf


    leal    -4(%ebp),%eax
    leal    -8(%ebp),%edx
    leal    -12(%ebp),%ecx
    movl    $msg_main_scan_row_column_plane_value,(%esp)
    movl    %eax,4(%esp)
    movl    %edx,8(%esp)
    movl    %ecx,12(%esp)
    call    scanf


    movl    -4(%ebp),%eax
    movl    $4,%edx
    mull    %edx
    movl    %eax,(%esp)
    call    malloc

    movl    %eax,-28(%ebp)

    cmpl   $NULL,%eax
    je     label_malloc_failed

    movl    $0,-16(%ebp)

    jmp     label_for_memory_allocation_2d_cond
label_for_memory_allocation_2d_statement:
    movl    -8(%ebp),%eax
    movl    $4,%edx
    mull    %edx
    movl    %eax,(%esp)
    call    malloc
    movl    %eax,%edx

    movl    -28(%ebp),%ebx
    movl    -16(%ebp),%eax
    movl    %edx,(%ebx,%eax,4)

    cmpl    $NULL,%edx
    je      label_malloc_failed

    addl    $1,-16(%ebp)
label_for_memory_allocation_2d_cond:
    movl    -16(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_memory_allcation_2d_statement

    movl    $0,-16(%ebp)
    jmp     label_for_memory_allcation_1d_plane_cond

label_for_memory_allcation_1d_plane_statement:
    movl    $0,-20(%ebp)
    jmp     label_for_memory_allcation_1d_row_cond
label_for_memory_allcation_1d_row_statement:
    movl    -24(%ebp),%eax
    movl    $4,%edx
    mull    %edx
    movl    %eax,(%esp)
    call    malloc
    movl    %eax,%edx

    movl    -16(%ebp),%eax
    movl    -28(%ebp),%ebx
    movl    (%ebx,%eax,4),%ebx

    movl    -20(%ebp),%eax
    movl    %edx,(%ebx,%eax,4)

    cmpl    $NULL,%edx
    je      label_malloc_failed

    addl    $1,-20(%ebp)

label_for_memory_allcation_1d_row_cond:
    movl    -20(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %eax,%edx
    jl      label_for_memory_allcation_1d_row_statement
    addl     $1,-16(%ebp)    
label_for_memory_allcation_1d_plane_cond:
    movl    -16(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_memory_allcation_1d_plane_statement


    movl    $0,-16(%ebp)
    jmp     label_for_scan_plan_condition
label_for_scan_plane_statement:
    movl    $0,-20(%ebp)
    jmp     label_for_scan_row_condition
label_for_scan_row_statement:
    movl    $0,-24(%ebp)
    jmp     label_for_scan_column_condition
label_for_scan_column_statement:

    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    -24(%ebp),%ecx
    movl    $msg_main_print_enter_value,(%esp)
    movl    %eax,4(%esp)
    movl    %edx,8(%esp)
    movl    %ecx,12(%esp)
    call    printf


    movl    -28(%ebp),%ebx
    movl    -16(%ebp),%eax
    movl    (%ebx,%eax,4),%ebx
    movl    -20(%ebx),%eax 
    movl    (%ebx,%eax,4),%ebx
    movl    -24(%ebp),%eax
    leal     (%ebx,%eax,4),%ebx
    movl      $msg_main_scan_enter_value,(%esp)
    movl      %ebx,4(%esp)
    call       scanf


    addl    $1,-24(%ebp)    
label_for_scan_column_condition:
    movl    -24(%ebp),%eax
    movl    -12(%ebp),%edx
    cmpl    %edx,%eax
    jl       label_for_scan_column_statement
    addl    $1,-20(%ebp)        
label_for_scan_row_condition:
    movl    -20(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_scan_row_statement
    addl    $1,-16(%ebp)        
label_for_scan_plan_condition:
    movl    -16(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_scan_plane_statement 

    movl    $msg_main_print_entered_value,(%esp)
    call    printf


  movl    $0,-16(%ebp)
    jmp     label_for_print_plan_condition
label_for_print_plane_statement:
    movl    $0,-20(%ebp)
    jmp     label_for_print_row_condition
label_for_print_row_statement:
    movl    $0,-24(%ebp)
    jmp     label_for_print_column_condition
label_for_print_column_statement:

        
    movl    -28(%ebp),%ebx
    movl    -16(%ebp),%eax
    movl    (%ebx,%eax,4),%ebx
    movl    -20(%ebx),%eax 
    movl    (%ebx,%eax,4),%ebx
    movl    -24(%ebp),%eax
    movl     (%ebx,%eax,4),%ebx
    movl    -16(%ebp),%edx
    movl    -20(%ebp),%ecx
    movl     $msg_main_print_value,(%esp)
    movl     %edx,4(%esp)
    movl     %ecx,8(%esp)
    movl     %eax,12(%esp)
    movl     %ebx,16(%esp)
    call     printf


    addl    $1,-24(%ebp)    
label_for_print_column_condition:
    movl    -24(%ebp),%eax
    movl    -12(%ebp),%edx
    cmpl    %edx,%eax
    jl       label_for_print_column_statement
    addl    $1,-20(%ebp)        
label_for_print_row_condition:
    movl    -20(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_print_row_statement
    addl    $1,-16(%ebp)        
label_for_print_plan_condition:
    movl    -16(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_print_plane_statement 

    pushl   $0
    call    exit


label_malloc_failed:
    pushl   $msg_main_print_malloc_failed
    call    printf
    addl    $4,%esp

    pushl   $-1
    call    exit    

    







