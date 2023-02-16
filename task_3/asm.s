.section .rodata
    msg_main_print1:
    .string "\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Extra\n"

    msg_main_print2:
    .string "Enter your choice:\n"

    msg_main_scan:
    .string "%d"

    msg_main_print3:
    .string "Enter two numbers:\n"

    msg_main_scan2:
    .string "%d%d"

    msg_main_print4:
    .string "Enter valid choice\n"

    msg_main_print5:
    .string "Anwer is %d\n"

    msg_main_print6:
    .string "Are you want to enter more choice?(1/0):\t"

.section .text
.globl  main 
.type   main,@function
main:
# Prolouge
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp
# do
label_do:
# printf("\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Extra\n");
   
    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp
#  printf("Enter your choice:\t");
    pushl   $msg_main_print2
    call    printf
    addl    $4,%esp

#    scanf("%d",&iCh);   
    leal    -16(%ebp),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

#   if(iCh > 0 &&  iCh < 5)
    movl    -16(%ebp),%eax
    cmpl    $0,%eax
    jle     label_switch_default

    movl    -16(%ebp),%eax
    cmpl    $5,%eax
    jg      label_switch_default
    movl    -16(%ebp),%eax
    cmpl    $5,%eax
    je      label_switch_case_5
    

#    printf("Enter two numbers:\t");
    pushl   $msg_main_print3
    call    printf
    addl    $4,%esp

#   scanf("%d%d",&iNo1,&iNo2);
    leal    -4(%ebp),%eax
    leal    -8(%ebp),%edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan2
    call    scanf
    addl    $12,%esp
#   switch(iCh)
 label_switch:
    movl    -16(%ebp),%eax
#   case 1:   
    cmpl    $1,%eax
    je      label_switch_case_1
#   case 2:    
    cmpl    $2,%eax  
    je      label_switch_case_2
#   case 3:  
    cmpl    $3,%eax
    je      label_switch_case_3
#   case 4:    
    cmpl    $4,%eax
    je      label_switch_case_4
#   case  5:    
    cmpl    $5,%eax
    je      label_switch_case_5
#   case default:    
    jmp     label_switch_default

label_switch_case_1:
#   iAns = Addition(iNo1,iNo2);
    movl    -4(%ebp),%eax
    movl    -8(%ebp),%edx
    pushl   %edx
    pushl   %eax
    call    Addition
    addl    $8,%esp
    movl    %eax,-12(%ebp)

#   break;
    jmp     label_switch_out

label_switch_case_2:
#   iAns = Subtraction(iNo1,iNo2);
    movl    -4(%ebp),%eax
    movl    -8(%ebp),%edx
    pushl   %edx
    pushl   %eax
    call    Subtraction
    addl    $8,%esp
    movl    %eax,-12(%ebp)

    jmp     label_switch_out

#  iAns = Multiplication(iNo1,iNo2);  
label_switch_case_3:
    movl    -4(%ebp),%eax
    movl    -8(%ebp),%ecx
    pushl   %ecx
    pushl   %eax
    call    Multiplication
    addl    $8,%esp
    movl    %eax,-12(%ebp)

#   break;
    jmp    label_switch_out

#   iAns = Division(iNo1.iNo2);
label_switch_case_4:
    movl    -4(%ebp),%eax
    movl    -8(%ebp),%ecx
    pushl   %ecx
    pushl   %eax
    call    Division
    addl    $8,%esp
    movl    %eax,-12(%ebp)

    jmp     label_switch_out

#   exit(0);
label_switch_case_5:
    jmp    label_out
#   printf("Enter valid choice\n");
label_switch_default:
    pushl   $msg_main_print4
    call    printf
    addl    $4,%esp
#     iCh = 1;  
    movl    $1,-16(%esp)
#   continue    
    jmp     label_do

label_switch_out:
#    printf("Anwer is %d\n",iAns);
    movl    -12(%ebp),%eax
    pushl   %eax
    pushl   $msg_main_print5
    call    printf
    addl    $8,%esp

#   printf("Are you want to enter more choice?(1/0):\t");
    pushl   $msg_main_print6
    call    printf
    addl    $4,%esp

#    scanf("%d",&iCh);
    leal    -16(%ebp),%eax
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

#   while(iCh == 1);
    movl    -16(%ebp),%eax
    cmpl    $1,%eax
    je      label_do

#   exit(0);
label_out:
    pushl   $0
    call    exit

#   int Addition(int iNo1,int iNo2)
 .globl Addition
 .type Addition, @function
 Addition:
 
    pushl   %ebp
    movl    %esp,%ebp
 #  return(iNo1+iNo2);  
    movl    8(%ebp),%eax
    movl    12(%ebp),%edx
    addl    %edx,%eax

    movl    %ebp,%esp
    popl    %ebp
    ret

#   int Subtraction(int iNo1,int iNo2)   
.globl  Subtraction
.type   Subtraction,@function
Subtraction:
    pushl   %ebp
    movl    %esp, %ebp
#   return(iNo1+iNo2);    
    movl    8(%ebp),%eax
    movl    12(%ebp),%edx
    subl    %edx,%eax

    movl    %ebp,%esp
    popl    %ebp
    ret

#   int Multiplication(int iNo1,int iNo2)
.globl  Multiplication
.type   Multiplication,@function
Multiplication:
    pushl   %ebp
    movl    %esp, %ebp
    
    movl    8(%ebp),%eax
    movl    12(%ebp),%ecx
    mull    %ecx

    movl    %ebp,%esp
    popl    %ebp
    ret

#   int Division(int iNo1,int iNo2)
.globl  Division
.type   Division,@function
Division:
    pushl   %ebp
    movl    %esp, %ebp
    
    xorl    %eax,%eax
    xorl    %edx,%edx
    xorl    %ecx,%ecx
    movl    8(%ebp),%eax
    movl    12(%ebp),%ecx
    divl    %ecx

    movl    %ebp,%esp
    popl    %ebp
    ret







    



       




    




                






