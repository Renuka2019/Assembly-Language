#include<stdio.h>

/* Function Declaration */
int Addition(int,int);

/*main */
int main(void)
{
    int no_1,no_2,ans;

    printf("Enter two numbers \n");
    scanf("%d%d",&no_1,&no_2);

    ans = Addition(no_1,no_2);

   printf("Addition of two no is %d \n",ans);

   return 0;


}

/* function definition */
int Addition(int no_1,int no_2)
{
   return(no_1+no_2);
}