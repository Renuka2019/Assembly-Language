#include<stdio.h>
#include<stdlib.h>
void SumDiff(int,int,int*,int*);

int main(void)
{
    int iNo1,iNo2;
    int iSum,iDiff

    printf("Enter two nmbers:\n");

    scanf("%d%d",&iNo1,&iNo2);

    SumDiff(iNo1,iNo2,&iSum,&iDiff);

    printf("Sum is %d\n",iSum);
    printf("Division is %d\n",iDiff);

    exit(0);
}

void   SumDiff(int iNo1,int iNo2,int *ipSum,int *ipDiff)
{
    *ipSum = iNo1 + iNo2;
    *ipDiff = iNo1 - iNo2;
}