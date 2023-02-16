.section .rodata
      msg_main_print1:
    .string " enter value of arr[2][3]\t"

    msg_main_scan:
    .string "%d"
   
    msg_main_print2:
    .string "arr[2][3]= %d"

    msg_main_print3:
    .string "Address of arr[2][3] is %d\n"

 
.section .text
.global main
.type main,@function

main:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $48,%esp



    leal  -4(%ebp),%ebx
    pushl %ebx
    pushl $msg_main_print3
    call  printf
    addl  $8,%esp


    
    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp


    movl    $4,%eax    # 4
    movl    $4,%edx   # size of(int)
    mull    %edx      # eax 16  
    movl    $2,%edx  # counter1
    mull    %edx     #eax 32
    leal    -48(%ebp),%ebx
    addl    %eax,%ebx   # 132
    movl    $3,%eax
    
    leal    (%ebx,%eax,4),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp



    movl    $4,%eax    # 4
    movl    $4,%edx   # size of(int)
    mull    %edx      # eax 16  
    movl    $2,%edx  # counter1
    mull    %edx     #eax 32
    leal    -48(%ebp),%ebx
    addl    %eax,%ebx   # 132
    movl    $3,%eax
    
    leal    (%ebx,%eax,4),%ebx
    pushl   %ebx
    pushl   $msg_main_print3
    call    printf
    addl    $8,%esp


    movl    $4,%eax    # 4
    movl    $4,%edx   # size of(int)
    mull    %edx      # eax 16  
    movl    $2,%edx  # counter1
    mull    %edx     #eax 32
    leal    -48(%ebp),%ebx
    addl    %eax,%ebx   # 132
    movl    $3,%eax
    movl   (%ebx,%eax,4),%edx  # 132+3*4
    pushl   %edx
    pushl   $msg_main_print2
    call    printf
    addl    $8,%esp

    pushl   $0
    call    exit


