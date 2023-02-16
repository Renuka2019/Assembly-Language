#include<stdio.h>
#include<stdlib.h>

// function declaration
int Substraction(int , int);

int main(void)
{
    int iNo1;
    int iNo2;
    int iAns;

    printf("Enter value of no1 and no2\n");
    scanf("%d%d",&iNo1,&iNo2);
     
     iAns =  Substraction(int ,int);

     printf("substraction is %d",iAns);

     return 0;


}


int Substraction(int iNo1,int iNo2)
{
    return(iNo1+iNo2);
    
}