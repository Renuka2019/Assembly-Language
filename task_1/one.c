#include<stdio.h>
#include<stdlib.h>

int no_1 = 10;
int no_2;

void fun1();

int main()
{
    int no_3;

    printf("Enter two numbers:\t");
    scanf("%d%d",&no_2,&no_3);

    printf("In main, no_1 = %d\t no_2 = %d\t no3 = %d\t \n",no_1,no_2,no_3);

    fun1();

    exit(0);
    
}
