#include<stdio.h>
#include<stdlib.h>

void fun(void);

int main(void)
{
    register int no = 10;

    printf("In main, brefore increment no is %d\n",no);

    no++;

    printf("In main,after increament no is %d\n",no);
    
    fun();
   

}

void fun(void)
{
    register int no = 30;
      printf("In fun, brefore increment no is %d\n",
      no);

    no++;

    printf("In fun,after increament no is %d\n",no);


}
