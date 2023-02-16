.equ NULL, 0
.section .rodata
    msg_main_print_show_choice:
    .string "\n1.Insert \n2.Delete\n3.Search\n4.Count\n5.Reverse Display\n6.Exit\n"

    msg_main_print_enter_choice:
    .string "Enter your choice: \t"

    msg_main_scan:
    .string "%d"

    msg_main_print_show_insert_choice:
    .string "\n1.InsertFirst\n2.Insert Last\n3.InsertAtPosition\n4.Back\n"

    msg_main_print_enter_insert_choice:
    .string "Enter your choice again: \t"

    msg_main_print_enter_valid_choice:
    .string "Enter Valid Choice\n"

    msg_main_print_enter_data:
    .string "Enter Data to be Insert:\t"

    msg_main_print_enter_position:
    .string "Enter position:\t"

    msg_main_print_show_delete_choice:
    .string "\n1.DeleteFirst \n2.DeleteLast\n3.DeleteAtPosition\n4.Back\n"

    msg_main_print_show_search_choice:
    .string "\n1.SearchFirstOccerance \n2.SearchLastOccurance\n3.SearchAllOccurance\n4.Back\n"


    msg_main_print_list_empty_deletion_impossiable:
    .string "Linked List Empty ,Deletion impossiable\n"

      msg_main_print_list_empty_searching_impossiable:
    .string "Linked List Empty ,Searching impossiable\n"

    msg_main_print_enter_data_to_search:
    .string  "Enter data to search:\t"

    msg_main_print_list_empty:
    .string "Linked list is Empty\n"

    msg_main_print_delete_data:
    .string "Deleted data is %d\n"

    msg_main_print_data_not_found:
    .string "Data not found\n"

    msg_main_print_data_found_at_position:
    .string "Data found at %d position\n"

    msg_main_print_bye:
    .string "Bye ...\n"

    msg_main_malloc_failed:
    .string "memory allocation Fallied\n"

    msg_insert_at_pos_print_invalid_position:
    .string "position is Invaid\n"

    msg_display_print_heading:
    .string "\nLinked List is:\n"

     msg_reverse_display_print_heading:
     .string "\nReverse Linked List is:\n"


    msg_display_print_empty_list:
    .string "EMPTY\n"

    msg_display_print_link_list:
    .string "<-|%d|->"

    msg_display_print:
    .string "\n"

    msg_main_data_found_times:
    .string "Data found %d times\n"

    msg_main_total_nodes_presents:
    .string "Total nodes presents : %d\n"

    msg_deleteall_all_nodes_deleted_successfully:
    .string "All nodes  deleted Successfully \n"

    
 .section .bss
 .comm  List,12,4
 

 .section .text
 .globl main
 .type main, @function

 main:
    pushl   %esp
    movl    %esp,%ebp
    andl    $-16,%esp

    subl    $48,%esp
 
    movl    $NULL,-16(%ebp)     #  struct List *pFirst = NULL;
    movl    $NULL,-20(%ebp)     #  struct List *pLast = NULL;


    movl   $1,%eax
    jmp    label_main_while_condition

label_main_while_statement:

    movl    $msg_main_print_show_choice,(%esp)   
    call    printf

    movl    $msg_main_print_enter_choice,(%esp)
    call    printf

    leal    -12(%ebp),%ebx
    movl    $msg_main_scan,(%esp)
    movl    %ebx,4(%esp)
    call    scanf


    movl    -12(%ebp),%eax                 # iChoice

    cmpl    $1,%eax                   
    je      label_main_switch_case_1       # case 1

    cmpl    $2,%eax                 
    je      label_main_switch_case_2      # case 2

    cmpl    $3,%eax                 
    je      label_main_switch_case_3      # case 3

    cmpl    $4,%eax                 
    je      label_main_switch_case_4      # case 4

    cmpl    $5,%eax                 
    je      label_main_switch_case_5      # case 5

    cmpl    $6,%eax
    je      label_main_switch_case_6       # case 6

    jmp    label_main_switch_default       # case default 

label_main_switch_case_1:
    movl    $msg_main_print_show_insert_choice,(%esp)
    call    printf

    movl    $msg_main_print_enter_insert_choice,(%esp)
    call    printf

    leal    -12(%ebp),%ebx
    movl    $msg_main_scan,(%esp)
    movl    %ebx,4(%esp)
    call    scanf


    movl    -12(%ebp),%eax                     # iChoice
    cmpl    $4,%eax                            # if(iChoice == 4)
    je      label_main_while_statement         # break

    cmpl    $0,%eax
    jle     label_insert_valid_choice                         
    cmpl    $3,%eax
    jle     label_switch_choice_insert         #   if(iChoice <= 0 || iChoice>3)
label_insert_valid_choice:
    movl    $msg_main_print_enter_valid_choice,(%esp)
    call    printf
    jmp     label_main_switch_case_1


label_switch_choice_insert:

    movl    $1,%eax
    jmp     label_insert_while_condition

label_insert_while_statement:
    movl    $msg_main_print_enter_data,(%esp)
    call    printf

    leal    -4(%ebp),%ebx
    movl    $msg_main_scan,(%esp)
    movl    %ebx,4(%esp)
    call    scanf


    movl    -12(%ebp),%eax                      # iChoice
    cmpl    $1,%eax                             
    je      label_switch_insert_choice_1    
    cmpl    $2,%eax
    je      label_switch_insert_choice_2
    cmpl    $3,%eax
    je      label_switch_insert_choice_3

label_switch_insert_choice_1:                   # case 1

    leal    -16(%ebp),%eax
    leal    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    -4(%ebp),%ecx
    movl    %ecx,8(%esp)
    call    InsertFirst                         # InsertFirst(&pFirst,&pLast,iNo);
   
   
    jmp     label_switch_insert_choice_out      # break


label_switch_insert_choice_2:                   # case 2

    leal    -16(%ebp),%eax
    leal    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    -4(%ebp),%ecx
    movl    %ecx,8(%esp)
    call    InsertLast                         # InsertLast(&pFirst,&pLast,iNo);
   
   
    jmp     label_switch_insert_choice_out     # break;

label_switch_insert_choice_3:                  # case 3                   
    movl    $msg_main_print_enter_position,(%esp)   
    call    printf

    leal    -8(%ebp),%eax                           
    movl    %eax,4(%esp)
    movl    $msg_main_scan,(%esp)
    call    scanf


    leal    -16(%ebp),%eax                  
    leal    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    -4(%ebp),%ecx
    movl    %ecx,8(%esp)
    movl    -8(%ebp),%ebx
    movl    %ebx,12(%esp)
    call    InsertAtPosition                 # InsertAtPosition(&pFirst,&pLast,iNo,iPos);

    jmp     label_switch_insert_choice_out   # break

label_switch_insert_choice_out:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    Display

    jmp     label_main_switch_case_1

    
    movl    $1,%eax

label_insert_while_condition:
    cmpl    $1,%eax
    je      label_insert_while_statement

    movl     $1,%eax
    jmp      label_main_while_condition


label_main_switch_case_2:                          
    movl    -16(%ebp),%eax
    cmpl    $NULL,%eax                     # if(NULL == pFirst)
    jne     label_delete_while

    movl    $msg_main_print_list_empty_deletion_impossiable,(%esp)
    call    printf

    jmp     label_main_while_statement

label_delete_while:
    movl    $1,%eax
    jmp     label_delete_while_condition

label_delete_while_statement:

    movl    $msg_main_print_show_delete_choice,(%esp)
    call    printf
    movl    $msg_main_print_enter_insert_choice,(%esp)
    call    printf

    leal    -12(%ebp),%ebx
    movl    %ebx,4(%esp)
    movl    $msg_main_scan,(%esp)
    call    scanf

    
    movl    -12(%ebp),%edx       
    cmpl    $4,%edx                     #   if(iChoice == 4)
    je      label_main_while_statement

    movl    -12(%ebp),%eax
    cmpl    $1,%eax
    je      label_switch_delete_choice1
    cmpl     $2,%eax
    je      label_switch_delete_choice2
    cmpl    $3,%eax
    je      label_switch_delete_choice3
    cmpl    $4,%eax
    jg      label_switch_delete_default
    cmpl    $0,%eax
    jle     label_switch_delete_default

label_switch_delete_choice1:                # case 1
    leal    -16(%ebp),%eax
    leal    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    DeleteFirst                     # DeleteFirst(&pFirst,&pLast)
    movl    %eax,-4(%ebp)                         

    jmp     label_switch_delete_out         # break

label_switch_delete_choice2:                # case 2
    leal    -16(%ebp),%eax                 
    leal    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    DeleteLast                      # DeleteLast(&pFirst,&pLast)

    movl    %eax,-4(%ebp)

    jmp     label_switch_delete_out

label_switch_delete_choice3:                # case 3
    movl    $msg_main_print_enter_position,(%esp) 
    call    printf

    leal    -8(%ebp),%ebx
    movl    %ebx,4(%esp)
    movl    $msg_main_scan,(%esp)
    call    scanf


    leal    -16(%ebp),%eax
    leal    -20(%ebp),%edx
    movl    -8(%ebp),%ecx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    %ecx,8(%esp)
    call    DeleteAtPosition            # DeleteAtPosition(&pFirst,&pLast)
    
    movl    %eax,-4(%ebp)

    jmp     label_switch_delete_out    

label_switch_delete_default:
    movl    $msg_main_print_enter_valid_choice,(%esp)
    call    printf

    movl    $4,-12(%ebp)

label_switch_delete_out:
    movl    -4(%ebp),%eax
    cmpl    $-1,%eax
    jne     label_delete_else_if

    movl    $msg_main_print_list_empty,(%esp)
    call    printf
    jmp     label_delete_while_statement

label_delete_else_if:
    movl    -4(%ebp),%edx
    movl    -12(%ebp),%eax
    cmpl    $4,%eax
    je      label_delete_while_statement
    cmpl    $-2,%edx
    je      label_delete_while_statement

 
    movl    -4(%ebp),%eax
    movl    $msg_main_print_delete_data,(%esp)
    movl    %eax,4(%esp)
    call    printf

    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    Display


label_delete_while_condition:
    cmpl    $1,%eax
    je      label_delete_while_statement

    jmp     label_main_while_statement


label_main_switch_case_3:
    movl    -16(%ebp),%eax
    cmpl    $NULL,%eax
    jne     label_search_while

    movl    $msg_main_print_list_empty_searching_impossiable,(%esp)
    call    printf

    jmp     label_main_while_statement

label_search_while:
    movl    $1,%eax
    jmp     label_search_while_condition
label_search_while_statement:
    movl    $msg_main_print_show_search_choice,(%esp)
    call    printf

    movl    $msg_main_print_enter_choice,(%esp)
    call    printf

    leal    -12(%ebp),%eax
    movl    %eax,4(%esp)
    movl    $msg_main_scan,(%esp)
    call    scanf

    movl    -12(%ebp),%eax
    cmpl    $4,%eax
    jne     label_search_invalid_choice_if

    jmp     label_main_while_statement

label_search_invalid_choice_if:
    cmpl    $0,%eax
    jle     label_search_valid_choice                         
    cmpl    $3,%eax
    jle     label_switch_choice_search         #   if(iChoice <= 0 || iChoice>3)
label_search_valid_choice:
    movl    $msg_main_print_enter_valid_choice,(%esp)
    call    printf
    jmp     label_main_switch_case_3

label_switch_choice_search:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    Display


    movl   $msg_main_print_enter_data_to_search,(%esp)
    call   printf

    leal    -4(%ebp),%eax
    movl    %eax,4(%esp)
    movl    $msg_main_scan,(%esp)
    call    scanf

    movl    -12(%ebp),%eax
    cmpl    $1,%eax
    je      label_switch_search_case_1

    cmpl    $2,%eax
    je      label_switch_search_case_2


    cmpl    $3,%eax
    je      label_switch_search_case_3


label_switch_search_case_1:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    -4(%ebp),%ecx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    %ecx,8(%esp)
    call    SearchFirstOccerance
    
    movl    %eax,-4(%ebp)

    cmpl    $-1,%eax
    jne     label_search_first_occurance_else_if

    movl    $msg_main_print_list_empty,(%esp)
    call    printf

    jmp     label_switch_case3_out

label_search_first_occurance_else_if:
    cmpl    $-2,%eax
    jne     label_search_first_occurance_else

    movl    $msg_main_print_data_not_found,(%esp)
    call    printf
    jmp     label_switch_case3_out    

 label_search_first_occurance_else:
    movl    $msg_main_print_data_found_at_position,(%esp)
    movl    -4(%ebp),%eax
    movl    %eax,4(%esp)
    call    printf

    jmp     label_switch_case3_out


label_switch_search_case_2:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    -4(%ebp),%ecx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    %ecx,8(%esp)
    call    SearchLastOccerance
    
    movl    %eax,-4(%ebp)

    cmpl    $-1,%eax
    jne     label_search_last_occurance_else_if

    movl    $msg_main_print_list_empty,(%esp)
    call    printf

    jmp     label_switch_case3_out

label_search_last_occurance_else_if:
    cmpl    $-2,%eax
    jne     label_search_last_occurance_else

    movl    $msg_main_print_data_not_found,(%esp)
    call    printf
    jmp     label_switch_case3_out    

 label_search_last_occurance_else:
    movl    $msg_main_print_data_found_at_position,(%esp)
    movl    -4(%ebp),%eax
    movl    %eax,4(%esp)
    call    printf

    jmp     label_switch_case3_out

label_switch_search_case_3:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    -4(%ebp),%ecx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    %ecx,8(%esp)
    call    SearchAllOccerance
    
    movl    %eax,-4(%ebp)


    movl    %eax,4(%esp)
    movl    $msg_main_data_found_times,(%esp)
    call    printf
    
    jmp     label_switch_case3_out

label_switch_case3_out:
    movl    $1,%eax

label_search_while_condition:
    cmpl    $1,%eax
    je      label_search_while_statement        




label_main_switch_case_4:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    Display

    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    CountNode
    movl    %eax,-4(%ebp)


    movl    %eax,4(%esp)
    movl    $msg_main_total_nodes_presents,(%esp)
    call    printf

    jmp    label_main_while_statement



label_main_switch_case_5:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    Display

    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    ReverseDisplay

    jmp    label_main_while_statement


label_main_switch_case_6:
    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    Display

    movl    -16(%ebp),%eax
    cmpl    $NULL,%eax
    je      label_if_out
   
    leal    -16(%ebp),%eax
    leal    -20(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    DeleteAll

label_if_out:
    movl    $msg_main_print_bye,(%esp)
    call    printf

    jmp     label_out
label_main_switch_default:
    movl    $msg_main_print_enter_valid_choice,(%esp)
    call    printf
    jmp    label_main_while_statement
    
label_main_while_condition:
    cmpl    $1,%eax
    je      label_main_while_statement

label_malloc_failed:

    movl    $msg_main_malloc_failed,(%esp)
    call    printf
        
label_out:
    pushl    $0
    call     exit




.globl  InsertFirst
.type   InsertFirst,@function
InsertFirst:
   pushl    %ebp
   movl     %esp,%ebp

   subl     $16,%esp

   movl     $NULL,-4(%ebp)      #   struct List *pNewNode = NULL;

   movl     $12,(%esp)          #   pNewNode = (struct List*) malloc(sizeof(struct List));
   call     malloc
   movl     %eax,-4(%ebp)


    cmpl    $0,%eax              #  if(NULL == pNewNode)
    je      label_malloc_failed    

    movl    -4(%ebp),%ebx       #  pNewNode 
    movl    16(%ebp),%eax       #  iNo     
    movl    %eax,4(%ebx)        #  pNewNode->iData = iNo;

    movl    8(%ebp),%ebx       # ppHead 

    cmpl    $0,(%ebx)          #  if(NULL == *ppHead)
    jne     label_InsertFirst_if


    movl    -4(%ebp),%eax     # pNewNode
    movl    %eax,(%ebx)       # (*ppHead) = pNewNode   
    movl    12(%ebp),%edx     # ppTail   
    movl    %eax,(%edx)       # (*ppTail)=pNewNode  

    movl    12(%ebp),%eax     # ppTail
    movl    (%eax),%eax       # *PPTail  
    movl    8(%ebp),%edx      # ppHead
    movl    (%edx),%edx       # *ppHead
    movl    %edx,8(%eax)      # (*ppTail)->pNext = *ppHead
    movl    %eax,(%edx)       # (*ppHead)->pPrev = *ppTail
    jmp     label_InsertFirst_out

label_InsertFirst_if:
    movl	8(%ebp), %eax     # ppHead     
	movl	(%eax), %edx      # *ppHead
	movl	-4(%ebp), %eax    # pNewNode
	movl	%edx, 8(%eax)     # pNewNode->pNext = *ppHead;
	
    movl	8(%ebp), %eax     # ppHead     
	movl	(%eax), %eax      # *ppHead
	movl	-4(%ebp), %edx    # pNewNode
	movl	%edx, (%eax)      # (*ppHead)->pPrev = pNewNode
	
    movl	8(%ebp), %eax     # ppHead
	movl	-4(%ebp), %edx    # pNewnode
	movl	%edx, (%eax)      # *ppHead = pNewNode
	
    movl	12(%ebp), %eax   # ppTail
	movl	(%eax), %eax     # *ppHead
	movl	8(%ebp), %edx    # ppHead
	movl	(%edx), %edx     # *ppHead   
	movl	%edx, 8(%eax)    # (*ppTail)->pNext = *ppHead
	
    movl	8(%ebp), %eax   # ppHead
	movl	(%eax), %eax    # *ppHead
	movl	12(%ebp), %edx  # ppTail
	movl	(%edx), %edx    # *ppTail
	movl	%edx, (%eax)    # (*ppHead)->pPrev = *ppTail;


label_InsertFirst_out:
   
    movl    %ebp,%esp
    popl    %ebp
    ret


.globl InsertLast
.type  InsertLast,@function
InsertLast:

   pushl    %ebp
   movl     %esp,%ebp

   subl     $16,%esp


   movl     $NULL,-4(%ebp)      #  struct List *pNewNode = NULL;

   movl     $12,(%esp)
   call     malloc
   movl     %eax,-4(%ebp)        # pNewNode = (struct List*)malloc(sizeof(struct List))


    cmpl    $0,%eax              # if(pNewNode == NULL)
    je      label_malloc_failed

    movl    -4(%ebp),%ebx       
    movl    16(%ebp),%eax
    movl    %eax,4(%ebx)       # pNewNode->iData = iNo;

    movl    8(%ebp),%ebx       # ppHead

    cmpl    $0,(%ebx)          # *ppHead == NULL
    jne     label_InsertLast_if


    movl    -4(%ebp),%eax     #  pNewNode
    movl    %eax,(%ebx)       #  *ppHead = pNewNode
    movl    12(%ebp),%edx     #  ppTail
    movl    %eax,(%edx)       #  *ppTail = pNewNode 

    movl    12(%ebp),%eax     # ppTail
    movl    (%eax),%eax       # *ppTail
    movl    8(%ebp),%edx      # ppHead
    movl    (%edx),%edx       # *ppHead
    movl    %edx,8(%eax)      # (*ppTail)->pNext = *ppHead
    movl    %eax,(%edx)       # (*ppHead)->pPrev = *ppTail
    jmp     label_InsertLast_out

label_InsertLast_if:
    movl	12(%ebp), %eax    #  ppTail      
	movl	(%eax), %edx      # *ppTail
	movl	-4(%ebp), %eax    # pNewNode  
	movl	%eax,8(%edx)      # (*ppTail)->pNext = pNewNode
	
    movl	12(%ebp), %eax   # ppTail       
	movl	(%eax), %eax     # *ppTail
	movl	-4(%ebp), %edx   # pNewNode
	movl    %eax,(%edx)      # pNewNode->pPrev = *ppTail
	
    
    movl	12(%ebp), %eax  # ppTail
	movl	-4(%ebp), %edx  # pNewNode
	movl	%edx, (%eax)    # *ppTail = pNewNode

	movl	12(%ebp), %eax  # ppTail
	movl	(%eax), %eax    # *ppTail
	movl	8(%ebp), %edx   # ppHead
	movl	(%edx), %edx    # *ppHead    
	movl	%edx, 8(%eax)   # (*ppTail)->pNext = *ppHead

	movl	8(%ebp), %eax   # ppHead
	movl	(%eax), %eax    # *ppHead
	movl	12(%ebp), %edx  # ppTail
	movl	(%edx), %edx    # *ppTail
	movl	%edx, (%eax)    # (*ppHead)->pPrev = *ppTail;


label_InsertLast_out:
   
    movl    %ebp,%esp
    popl    %ebp
    ret


.globl InsertAtPosition
.type   InsertAtPosition,@function
InsertAtPosition:
   pushl    %ebp
   movl     %esp,%ebp

   subl     $16,%esp

   movl     $NULL,-4(%ebp)      # struct List *pNewNode = NULL;
   movl     $NULL,-8(%ebp)      # struct List *pTemp = NULL

   movl      8(%ebp),%eax       
   movl      (%eax),%eax
   movl     12(%ebp),%edx
   movl     (%edx),%edx
   movl     %eax,(%esp)
   movl     %edx,4(%esp)
   call     CountNode          # CountNode(*ppHead,*ppTail);
   movl    %eax,-12(%ebp)

   movl     20(%ebp),%eax      # iPos
   cmpl     $0,%eax            # iPos <= 0
   jle      label_insert_at_pos_invalid_pos_if

   movl     20(%ebp),%eax      # iPos
   movl     -12(%ebp),%edx     # iCount
   addl     $1,%edx            # iCount+1      
   cmpl     %edx,%eax          # iPos > iCount+1 
   jle      label_insert_at_pos_if_first_node     # if(ipos <= 0 || iPos > iCount +1)

label_insert_at_pos_invalid_pos_if:
   movl    $msg_insert_at_pos_print_invalid_position,(%esp)
   call    printf
   jmp     label_insert_at_pos_out


label_insert_at_pos_if_first_node:
    movl  -20(%ebp),%eax
    cmpl    $1,%eax                         #   1 == iPos 
    jne     label_insert_at_pos_if_last_node
    
    movl    8(%ebp),%eax
    movl    12(%ebp),%edx
    movl    16(%ebp),%ecx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    %ecx,8(%esp)
    call     InsertFirst                 # InsertFirst(ppHead,ppTail,iNo)

    jmp     label_insert_at_pos_out



label_insert_at_pos_if_last_node:
    movl  -12(%ebp),%eax
    addl    $1,%eax
    movl    20(%ebp),%edx

    cmpl    %edx,%eax                   # if(iCount +1 == iPos)
    jne     label_insert_at_pos_if_middle_node
    
    movl    8(%ebp),%eax
    movl    12(%ebp),%edx
    movl    16(%ebp),%ecx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    movl    %ecx,8(%esp)
    call     InsertLast               # InsertLast(ppHead,ppTail,iNo)

    jmp     label_insert_at_pos_out


label_insert_at_pos_if_middle_node:
    movl    8(%ebp),%eax            # ppHead
    movl    (%eax),%eax             # *ppHead
    movl    %eax,-8(%ebp)           # pTemp = *ppHead

    movl    $1,-12(%ebp)            # iCount = 1;

    jmp     label_insert_at_pos_while_condition
label_insert_at_pos_while_statement:
    addl    $1,-12(%ebp)            # iCount++
    movl    -8(%ebp),%eax           # pTemp
    movl     8(%eax),%eax           # pTemp->Next
    movl    %eax,-8(%ebp)           # pTemp = pTemp->pNext

label_insert_at_pos_while_condition:
    movl    -12(%ebp),%eax         # iCount 
    movl    20(%ebp),%edx          # iPos
    subl    $1,%edx                # iPos -1
    cmpl    %edx,%eax              # (iCount < iPos-1)
    jl      label_insert_at_pos_while_statement

    
    movl     $12,(%esp)
    call     malloc
    movl     %eax,-4(%ebp)        # pNewNode = (struct List*)malloc(sizeof(struct List))


    cmpl    $NULL,%eax            # if(NULL == pNewNode)
    je      label_malloc_failed

    movl    -4(%ebp),%ebx         # pNewNode 
    movl    16(%ebp),%eax         # iNo
    movl    %eax,4(%ebx)          # pNewNode->iData = iNo


	movl	-8(%ebp), %eax        # pTemp
	movl	8(%eax), %edx         # pTemp -> pNext  
	movl	-4(%ebp), %eax        # pNewNode 
	movl	%edx, 8(%eax)         # pNewNode->pNext =pTemp->pNext  

	movl	-8(%ebp), %eax        # pTemp      
	movl	8(%eax), %eax         # pTemp ->pNext 
	movl	-4(%ebp), %edx        # pNewNode
	movl	%edx, (%eax)          # pTemp ->pNext->prev   = pNewNode
	
    movl	-8(%ebp), %eax        # pTemp 
	movl	-4(%ebp), %edx        # pNewNode
	movl	%edx, 8(%eax)         #  pTemp -> pNext = pNewNode
	
    movl	-4(%ebp), %eax        #  pNewNode
	movl	-8(%ebp), %edx        #  pTemp
	movl	%edx, (%eax)          #  pNewNode->pPrev = pTemp

label_insert_at_pos_out:
  movl    %ebp,%esp
  popl    %ebp
  ret


.globl  DeleteFirst
.type   DeleteFirst,@function
DeleteFirst:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    8(%ebp),%eax
    movl    (%eax),%eax
    cmpl    $NULL,%eax
    jne      label_delete_not_null
    
    movl    $-1,%eax
    jmp     label_delete_first_out
label_delete_not_null:
    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    4(%eax),%eax    # ppHead -> iData
    movl    %eax,-4(%ebp)   # iDeldata = ppHead ->iData


    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    12(%ebp),%edx   # ppTail
    movl    (%edx),%edx
    cmpl     %edx,%eax     # if(*ppHead == *ppTail)
    jne     label_delete_not_first_node

    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    $NULL,8(%eax)   # (*ppHead)->pNext = NULL
    movl    12(%ebp),%edx   # ppTail
    movl    (%edx),%edx     # *ppTail
    movl    $NULL,(%eax)    # (*ppTail)->pPrev = NULL
    
    movl    8(%ebp),%eax   # ppHead
    movl    (%eax),%eax    # *ppHead
    movl    %eax,(%esp)
    call    free           # free(ppHead)

    movl    8(%ebp),%eax   # ppHead
    movl    $NULL,(%eax)   # *ppHead = NULL
    movl    12(%ebp),%eax  #  ppHead
    movl    $NULL,(%eax)   # *ppTail = NULL


    movl    -4(%ebp),%eax   # return iDelData
    jmp     label_delete_first_out
    

label_delete_not_first_node:

    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    8(%eax),%edx    # (*ppHead -> pNext)
    movl   8(%ebp),%eax     # ppHead 
    movl    %edx,(%eax)    # *ppHead = (*PPhead)-> pnext

    movl    12(%ebp),%eax   # ppTail
    movl    (%eax),%eax     # *ppTail
    movl    8(%eax),%eax    # *ppTail->pNext
    movl    $NULL,8(%eax)   #  *ppTail->pNext->PNext = NULL

    movl    12(%ebp),%eax   # ppTail
    movl    (%eax),%eax     # *ppTail
    movl    8(%eax),%eax    # *ppTail->pNext
    movl    $NULL,(%eax)   #  *ppTail->pNext->pPrev = NULL

    movl    12(%ebp),%eax   # ppTail
    movl    (%eax),%eax     # *ppTail
    movl    8(%eax),%eax    # *ppTail->pNext
    movl    %eax,(%esp)
    call    free            # free(*ppTail->pNext)

    movl    12(%ebp),%eax   # ppTail
    movl    (%eax),%eax     # *ppTail
    movl    8(%ebp),%edx    # ppHead
    movl    (%edx),%edx     # *ppHead
    movl    %edx,8(%eax)    # (*ppTail)->pNext = *ppHead

    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    12(%ebp),%edx   # ppTail
    movl    (%edx),%edx     # *ppTail
    movl    %edx, (%eax)    # *ppHead->pPrev = *ppTail


    movl    -4(%ebp),%eax   # return iDelData


label_delete_first_out:
    movl    %ebp,%esp
    popl    %ebp
    ret

.globl  DeleteLast
.type   DeleteLast,@function
DeleteLast:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    8(%ebp),%eax
    movl    (%eax),%eax
    cmpl    $NULL,%eax
    jne      label_delete_last_not_null
    
    movl    $-1,%eax
    jmp     label_delete_last_out
label_delete_last_not_null:
    movl    12(%ebp),%eax    # ppTail
    movl    (%eax),%eax     # *ppTail
    movl    4(%eax),%eax    # ppTail -> iData
    movl    %eax,-4(%ebp)   # iDeldata = *ppTail ->iData


    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    12(%ebp),%edx   # ppTail
    movl    (%edx),%edx
    cmpl     %edx,%eax     # if(*ppHead == *ppTail)
    jne     label_delete_last_not_first_node

    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    $NULL,8(%eax)   # (*ppHead)->pNext = NULL
    movl    12(%ebp),%edx   # ppTail
    movl    (%edx),%edx     # *ppTail
    movl    $NULL,(%eax)    # (*ppTail)->pPrev = NULL
    
    movl    8(%ebp),%eax   # ppHead
    movl    (%eax),%eax    # *ppHead
    movl    %eax,(%esp)
    call    free           # free(ppHead)

    movl    8(%ebp),%eax   # ppHead
    movl    $NULL,(%eax)   # *ppHead = NULL
    movl    12(%ebp),%eax  #  ppHead
    movl    $NULL,(%eax)   # *ppTail = NULL


    movl    -4(%ebp),%eax   # return iDelData
    jmp     label_delete_last_out
    

label_delete_last_not_first_node:

    movl    12(%ebp),%eax    # ppTail
    movl    (%eax),%eax      # *pptail
    movl    (%eax),%edx      # (*ppTail -> pPrev)
    movl    12(%ebp),%eax    # ppTail 
    movl    %edx,(%eax)      # *ppTail= (*ppTail)-> pPrev

    movl    8(%ebp),%eax     # ppHead
    movl    (%eax),%eax      # *ppHead
    movl    (%eax),%eax      # *ppHead->ppPrev
    movl    $NULL,8(%eax)    #  *ppHead->pPrev->PNext = NULL

    movl    8(%ebp),%eax     # ppHead
    movl    (%eax),%eax      # *ppHead
    movl    (%eax),%eax      # *ppHead->pPrev
    movl    $NULL,(%eax)     #  *ppHead->pPrev->pPrev = NULL

    movl    8(%ebp),%eax     # ppHead
    movl    (%eax),%eax      # *ppHead
    movl    (%eax),%eax      # *ppHrad->pPrev
    movl    %eax,(%esp)
    call    free            # free(*ppHead->pPrev)

    movl    12(%ebp),%eax   # ppTail
    movl    (%eax),%eax     # *ppTail
    movl    8(%ebp),%edx    # ppHead
    movl    (%edx),%edx     # *ppHead
    movl    %edx,8(%eax)    # (*ppTail)->pNext = *ppHead

    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    12(%ebp),%edx   # ppTail
    movl    (%edx),%edx     # *ppTail
    movl    %edx, (%eax)    # *ppHead->pPrev = *ppTail


    movl    -4(%ebp),%eax   # return iDelData


label_delete_last_out:
    movl    %ebp,%esp
    popl    %ebp
    ret

.globl  DeleteAtPosition
.type   DeleteAtPosition,@function
DeleteAtPosition:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    $NULL,-4(%ebp)

    movl    8(%ebp),%eax   #   ppHead
    movl    (%eax),%eax    #  *ppHead
    movl    12(%ebp),%edx  #   ppTail
    movl    (%eax),%edx    #  *ppTail
    movl    %eax,(%esp)    #  
    movl    %edx,4(%esp)  
    call    CountNode      # CountNode(*ppHead,*ppTail)

    movl    %eax,-8(%ebp)

    movl    16(%ebp),%eax
    cmpl    $0,%eax
    jle     label_delete_at_pos_invalid_pos_if
    movl    -8(%ebp),%edx   # iCount
    movl    16(%ebp),%eax   # iPos
    cmpl    %edx,%eax       # ipos>iCount
    jle     label_delete_at_pos_invalid_pos_if_out


label_delete_at_pos_invalid_pos_if:
    movl    $msg_insert_at_pos_print_invalid_position,(%esp)
    call    printf
    movl    $-2,%eax
    jmp     label_delete_at_pos_out 

label_delete_at_pos_invalid_pos_if_out:
    movl    16(%ebp),%eax
    cmpl    $1,%eax        # 1 == iPos
    jne     label_delete_at_pos_not_first_node_if

    movl    8(%ebp),%eax
    movl    12(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    DeleteFirst    # DeleteFirst(ppHead,ppTail);

    jmp    label_delete_at_pos_out
 
label_delete_at_pos_not_first_node_if:
    movl    -8(%ebp),%eax
    movl    16(%ebp),%edx

    cmpl    %edx,%eax
    jne     label_delete_last_not_last_node

    movl    8(%ebp),%eax
    movl    12(%ebp),%edx
    movl    %eax,(%esp)
    movl    %edx,4(%esp)
    call    DeleteLast    # DeleteLast(ppHead,ppTail);

    jmp    label_delete_at_pos_out
label_delete_last_not_last_node:
    movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    %eax,-4(%ebp)   # pTemp = *ppHead


    movl    $1,-8(%ebp)     # iCount = 1

    jmp     label_while_delete_at_pos_condition
label_while_delete_at_pos_statement:
    addl    $1,-8(%ebp)    # iCount++
    movl    -4(%ebp),%eax  # pTemp
    movl    8(%eax),%eax   # pTemp->pNext
    movl    %eax,-4(%ebp)  # pTemp = pTemp->pNext

label_while_delete_at_pos_condition:
    movl    -8(%ebp),%eax
    movl    16(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_while_delete_at_pos_statement

    movl	-4(%ebp), %eax    # pTemp
	movl	(%eax), %eax      # pTemp->pPrev
	movl	-4(%ebp), %edx    # pTemp
	movl	8(%edx), %edx     # pTemp->pNext
	movl	%edx, 8(%eax)     # pTemp->pPrev->pNext= pTemp->pNext
	
	movl	-4(%ebp), %eax    # ptemp
	movl	8(%eax), %eax     # ptemp->pNext
	movl	-4(%ebp), %edx    # pTemp
	movl	(%edx), %edx      # pTemp -> pPrev
	movl	%edx, (%eax)      # pTemp->pNext->pPrev = pTemp -> pPrev
	
    movl	-4(%ebp), %eax    # pTemp
	movl	$NULL, 8(%eax)    # pTemp -> pNext = NULL       
	
    movl	-4(%ebp), %eax    # pTemp
	movl	$NULL, (%eax)     # pTemp ->pPrev
	
    
    movl	-4(%ebp),%eax    # pTemp
	movl	4(%eax), %eax    # ptemp->data
	movl	%eax, -8(%ebp)   # iCount = pTemp->data
   
    movl   -4(%ebp),%eax  # pTemp
    movl    %eax,(%esp)   # 
    call    free

    movl   -8(%ebp),%eax

label_delete_at_pos_out:
    movl    %ebp,%esp
    popl    %ebp
    ret

.globl  SearchFirstOccerance
.type   SearchFirstOccerance,@function
SearchFirstOccerance:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp


    movl    8(%ebp),%eax               #  pHead
    cmpl    $NULL,%eax                 #  pHead == NULL
    jne     label_search_first_occerance_not_empty

    movl    $-1,%eax                  # return -1
    jmp     label_first_occerance_out

label_search_first_occerance_not_empty:
    movl    $1,-4(%ebp)                # iPos = 1  

label_search_first_occerance_do_while:
    
    movl   8(%ebp),%eax               # pHead
    movl   4(%eax),%eax               # pHead-> iData
    movl   16(%ebp),%edx              # iKey
    cmpl   %edx,%eax                  #  pHead-> iData == iKey
    je      label_first_occerance_out #  break
    
    addl    $1,-4(%ebp)               # iPos++

    movl    8(%ebp),%eax              # pHead
    movl    8(%eax),%eax              # pHead -> Next
    movl    %eax,8(%ebp)              # pHead = pHead ->pNext

    movl    12(%ebp),%edx             # pTail
    movl    8(%edx),%edx              # pTail -> pNext
    movl    8(%ebp),%eax              # pTail
    cmpl    %edx,%eax                 # pTail =  pTail -> pNext    
    jne     label_search_first_occerance_do_while

    movl    12(%ebp),%edx            # pTail
    movl    8(%edx),%edx             # PTail ->PNext    
    movl    8(%ebp),%eax             # pHead
    cmpl    %edx,%eax                # pHead = PTail ->PNext
    jne      label_first_occerance_out

    movl   -4(%ebp),%eax            # return iPos
    cmpl    $1,%eax
    je      label_first_occerance_out

    movl    $-2,-4(%ebp)

label_first_occerance_out:
    movl    -4(%ebp),%eax
    movl    %ebp,%esp
    popl    %ebp
    ret


.globl  SearchLastOccerance
.type   SearchLastOccerance,@function
SearchLastOccerance:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp


    movl    8(%ebp),%eax                        # pHead
    cmpl    $NULL,%eax                          # NULL == pHead
    jne     label_search_last_occerance_not_empty

    movl    $-1,%eax                            # return -1
    jmp     label_last_occerance_out

label_search_last_occerance_not_empty:
    movl    $1,-4(%ebp)                         # iPos = 1
    movl    $0,-8(%ebp)                         # iLast = 0; 

label_search_last_occerance_do_while:
    
    movl   8(%ebp),%eax                         # pHead
    movl   4(%eax),%eax                         # pHead-> iData
    movl   16(%ebp),%edx                        # iKey
    cmpl   %edx,%eax                            # pHead-> iData == iKey
    jne      label_last_occerance_if_out

    movl    -4(%ebp),%eax                       # iPos
    movl    %eax,-8(%ebp)                       # iLast = ipos 

label_last_occerance_if_out:
    
    addl    $1,-4(%ebp)                         # ipos++

    movl    8(%ebp),%eax                        # pHead
    movl    8(%eax),%eax                        # pHead -> pNext
    movl    %eax,8(%ebp)                        # pHead = pHead->pNext      

    movl    12(%ebp),%edx                       # pTail
    movl    8(%edx),%edx                        # pTail->pNext
    movl    8(%ebp),%eax                        # pHead
    cmpl    %edx,%eax                           # pHead = pTail -> pNext
    jne     label_search_last_occerance_do_while

    movl    -8(%ebp),%eax                       #   iLast
    cmpl    $0,%eax                             #  0 == iLast
    jne     label_last_occerance_out

    movl    $-2,-8(%ebp)                        # return -2

label_last_occerance_out:
    movl    -8(%ebp),%eax
    movl    %ebp,%esp
    popl    %ebp
    ret


.globl  SearchAllOccerance
.type   SearchAllOccerance,@function
SearchAllOccerance:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    $0,-4(%ebp)

    movl    8(%ebp),%eax
    cmpl    $NULL,%eax
    jne     label_search_all_occerance_do_while

    jmp     label_all_occerance_out


label_search_all_occerance_do_while:
    
    movl   8(%ebp),%eax     # pHead
    movl   4(%eax),%eax     # pHead->idata
    movl   16(%ebp),%edx    # iNo
    cmpl   %edx,%eax       # if(pHead->idata == iKey)
    jne      label_all_occerance_if_out
    
    addl    $1,-4(%ebp)

label_all_occerance_if_out:    

    movl    8(%ebp),%eax
    movl    8(%eax),%eax
    movl    %eax,8(%ebp)

    movl    12(%ebp),%edx
    movl    8(%edx),%edx
    movl    8(%ebp),%eax
    cmpl    %edx,%eax
    jne     label_search_all_occerance_do_while

   label_all_occerance_out:
    movl    -4(%ebp),%eax
    movl    %ebp,%esp
    popl    %ebp
    ret


.globl  Display
.type   Display,@function
Display:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    $msg_display_print_heading,(%esp)
    call    printf

    movl    8(%ebp),%eax
    cmpl    $0,%eax
    jne     label_display_do_while

    movl    $msg_display_print_empty_list,(%esp)
    call    printf
    jmp     label_display_out

label_display_do_while:
    movl    8(%ebp),%ebx
    movl    4(%ebx),%eax
    movl    %eax,4(%esp)
    movl    $msg_display_print_link_list,(%esp)
    call    printf

    movl    8(%ebp),%eax
    movl    8(%eax),%eax
    movl    %eax,8(%ebp)

    movl    12(%ebp),%edx
    movl    8(%edx),%edx
    movl    8(%ebp),%eax
    cmpl    %edx,%eax
    jne     label_display_do_while


    movl    $msg_display_print,(%esp)
    call    printf
    
label_display_out:
    movl    %ebp,%esp
    popl    %ebp
    ret


.globl  DeleteAll
.type   DeleteAll,@function
DeleteAll:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    8(%ebp),%eax
    movl    (%eax),%eax
    cmpl    $NULL,%eax
    jne      label_delete_all_while_condition
    
    jmp     label_delete_first_out
label_delete_all_while_statement:
   
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$NULL, (%eax)

	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)

	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %eax
	movl	$NULL, 8(%eax)

    movl    12(%ebp),%eax 
    movl    (%eax),%eax      
    movl    8(%eax),%eax     
    movl    %eax,(%esp)     
    call    free
    
   	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, 8(%eax)

label_delete_all_while_condition:
     movl    8(%ebp),%eax    # ppHead
    movl    (%eax),%eax     # *ppHead
    movl    12(%ebp),%edx   # ppTail
    movl    (%edx),%edx
    cmpl     %edx,%eax     # if(*ppHead == *ppTail)
    jne     label_delete_all_while_statement    


    movl    8(%ebp),%eax   # ppHead
    movl    (%eax),%eax    # *ppHead
    movl    $NULL,8(%eax)  # *ppHead->pNext = NULL

    movl    8(%ebp),%eax   # ppHead
    movl    (%eax),%eax    # *ppHead
    movl    $NULL,(%eax)  # *ppHead->pPrev = NULL 
 
    movl    8(%ebp),%eax   # ppHead
    movl    (%eax),%eax    # *ppHead
    movl    %eax,(%esp)
    call    free           # free(*ppHead)

    movl    8(%ebp),%eax  #  ppHead
    movl    $NULL,(%eax)   # *ppHead = NULL

    movl    12(%ebp),%eax  #  ppTail
    movl    $NULL,(%eax)   # *ppTail = NULL


    movl    $msg_deleteall_all_nodes_deleted_successfully,(%esp)
    call    printf
   

label_delete_all_out:
    movl    %ebp,%esp
    popl    %ebp
    ret

.globl  ReverseDisplay
.type   ReverseDisplay,@function
ReverseDisplay:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    $msg_reverse_display_print_heading,(%esp)
    call    printf

    movl    12(%ebp),%eax
    cmpl    $NULL,%eax
    jne     label_reverse_display_do_while

    movl    $msg_display_print_empty_list,(%esp)
    call    printf
    jmp     label_reverse_display_out

label_reverse_display_do_while:
    movl    12(%ebp),%ebx
    movl    4(%ebx),%eax
    movl    %eax,4(%esp)
    movl    $msg_display_print_link_list,(%esp)
    call    printf

    movl    12(%ebp),%eax
    movl    (%eax),%eax
    movl    %eax,12(%ebp)

    movl    12(%ebp),%eax
    movl    8(%ebp),%edx
    movl    (%edx),%edx
    cmpl    %edx,%eax
    jne     label_reverse_display_do_while


    movl    $msg_display_print,(%esp)
    call    printf
    
label_reverse_display_out:
    movl    %ebp,%esp
    popl    %ebp
    ret


.globl  CountNode
.type   CountNode,@function
CountNode:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp


    movl    $0,-4(%ebp)

    
    movl    8(%ebp),%eax
    cmpl    $NULL,%eax
    jne     label_count_node_do_while

   
    jmp     label_count_node_out
    

label_count_node_do_while:
    addl    $1,-4(%ebp)

    movl    8(%ebp),%eax
    movl    8(%eax),%eax
    movl    %eax,8(%ebp)

    movl    12(%ebp),%edx
    movl    8(%edx),%edx
    movl    8(%ebp),%eax
    cmpl    %edx,%eax
    jne     label_count_node_do_while
 
label_count_node_out:
    movl    -4(%ebp),%eax
    movl    %ebp,%esp
    popl    %ebp
    ret








