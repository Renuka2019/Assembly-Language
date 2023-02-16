#include<stdio.h>
#include<stdlib.h>

#define MAX 50
int main(void)
{
    int iRow;
    int iColumn;
    int iCounter1;
    int iCounter2;

    int **ppiArr = NULL;

    printf("Enter the vales of rows and column(< %d)\n",MAX);
    scanf("%d%d",&iRow,&iColumn);

    ppiArr = (int **)malloc(iRow*sizeof(int*));
    if(ppiArr == NULL)
    {
        printf("Mempey Allocation FAILED");
        exit(-1);
    }

      for(iCounter1=0;iCounter1<iRow;iCounter1++)
    {
        ppiArr[iCounter1]= (int *)malloc(iColumn*sizeof(int));
        if(ppiArr[iCounter1]== NULL)
        {
            printf("Mempey Allocation FAILED");
            exit(-1);     
        }
    }

    for(iCounter1=0;iCounter1<iRow;iCounter1++)
    {
        for(iCounter2=0;iCounter2<iColumn;iCounter2++)
        {
            printf("Enter[%d][%d]value\t",iCounter1,iCounter2);
            scanf("%d", &ppiArr[iCounter1][iCounter2]);
        }
    }

    printf("Entered value are\n");
    for(iCounter1=0;iCounter1<iRow;iCounter1++)
    {
        for(iCounter2=0;iCounter2<iColumn;iCounter2++)
        {
            printf("iArr[%d][%d]= %d\t",iCounter1,iCounter2,ppiArr[iCounter1][iCounter2]);
        }
    }

  for(iCounter1=0;iCounter1<iRow;iCounter1++)
    {
        free(ppiArr[iCounter1]);
        ppiArr[iCounter1] = NULL;

    }
    free(ppiArr);
    ppiArr = NULL;


    exit(0);
}