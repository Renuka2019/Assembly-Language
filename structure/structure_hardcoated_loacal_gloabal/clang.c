#include<stdio.h>
#include<stdlib.h>


struct demo
{
    char chchar;
    int iNo;
    short int shiNo;

}obj{'A,10,20};

int main()
{
    struct demo obj2 = {'B',30,40};
    printf("obj1 is \n")
    printf("chChar = %c ,iNo = %d shiNo = %hd\n\n",obj1.chChar,obj1.iNo,obj1.shiNo);

    printf("obj2 is \n")
    printf("chChar = %c ,iNo = %d shiNo = %hd\n\n",obj2.chChar,obj2.iNo,obj2.shiNo);

}