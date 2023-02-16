#include<stdio.h>
#include<stdlib.h>

struct demo
{
    char chChar;
    int iNo;
    short int shiNo;

}obj1;


int main()
{
    struct demo obj2;
    struct deno obj3;

    printf("Enter the value of obj2\n);
    printf(" enter chChar\t:");
    scanf("%c",&obj2.chChar);

    printf(" enter iNo\t:");
    scanf("%d",&obj2.iNo);

    printf(" enter shiNo\t:");
    scanf("%hd",&obj2.shiNo);

    printf("obj2 is \n");
    printf("obj1.chChar is %c  obj2.iNo is %d obj2.shiNo is %hd",obj2.chChar,obj2.iNo,obj2.chChar);


    obj1.chChar = obj2.chChar;
    obj1.iNo= obj2.iNo;
    obj1.shiNo = obj2.shiNo;

     obj3.chChar = obj2.chChar;
    obj3.iNo= obj2.iNo;
    obj3.shiNo = obj2.shiNo;


    printf("obj1 is \n");
    printf("obj1.chChar is %c  obj1.iNo is %d obj1.shiNo is %hd",obj1.chChar,obj1.iNo,obj1.chChar);






 pushl       $msg_main_print_enter_short_interger
        call        printf
        addl        $4,%esp




}