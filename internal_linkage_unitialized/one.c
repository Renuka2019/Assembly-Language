#include<stdio.h>
#include<stdlib.h>

void fun(void);

int main()
{
    extern int iNo;

    printf("In main,number is %d\n",iNo);

    fun();
    exit(0);
    
}

int g_no = 20;

