#include<stdio.h>
#include<stdlib.h>

int main(void)
{
    int iNo1;
    int iNo2;
    int iNo3;
    int iAns;


    printf("Enter three numbers \n");
    scanf("%d%d%d",&iNo1,&iNo2,&iNo3);

    iAns = iNo1 < iNo2 != iNo3;

    printf("Answer is %d\n",iAns);

    exit(0);    

}