#include<stdio.h>
#include<sstdlib.h>

#define MAX 50
int main(void)
{
    int iRow;
    int iColumn;
    int iCounter1;
    int iCounter2;

    int arr[MAX][MAX];

    printf("Enter the vales of rows and column(< %d)\n",MAX);
    scanf("%d%d",&iRow,iColumn);

    for(iCounter1=0;iCounter1<iRow;i++)
    {
        for(iCounter2=0;iCounter2<iColumn;i++)
        {
            printf("Enter[%d][%d]value\t")
            scanf("%d",&arr[iCounter1][iCounter2]);
        }
    }

    printf("Entered value are\n");
    for(iCounter1=0;iCounter1<iRow;i++)
    {
        for(iCounter2=0;iCounter2<iColumn;i++)
        {
            printf("iArr[%d][%d]= %d\t")
        }
    }

    exit(0);
}