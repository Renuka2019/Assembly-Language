#include<stdio.h>
#include<stdlib.h>

static int no_1;
static int no_2 = 40;

static void fun2()
{
    printf("In static fun2");
    
}

void fun1()
{
    printf("Enter value of gno_1");
    scanf("%d",&no_1);

    printf("In fun, no_1 is %d and no_2 is %d\n",no_1,no_2);

    fun2();
}


