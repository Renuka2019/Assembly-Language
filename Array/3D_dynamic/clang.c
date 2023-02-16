#include<stdio.h>
#include<sstdlib.h>

#define MAX 50
int main(void)
{
    int iRow;
    int iColumn;
    int iplanes;
    int iCounter1;
    int iCounter2;
    int iCounter3;

    int ***arr = NULL; 

    printf("Enter the vales of plane, rows and column)\n",MAX);
    scanf("%d%d",&iplanes,&iRow,&iColumn);

    arr  = (int***)malloc(iplanes*sizeof(int**));
    if( == NULL)
    {
        puts("Memory allocation failed\n");
        return -1;
    }
    for(iCounter1 = 0;iCounter1<iplanes;iCounter1++)
    {
        arr[iCounter1] = (int**)malloc(iRow*sizeof(int*));
        if(arr[i] == NULL)
        {
            puts("Memory allocation failed\n");
            return -1;
        }

    }

    for(iCounter1 = 0;iCounter1<iplanes;iCounter1++)
    {
        for(iCounter2 = 0;iCounter2<iRow;iCounter2++)
        {
            arr[iCounter1][iCounter2]= (int*)malloc(iColumn*sizeof(int));
        }
    }

for(iCounter1 = 0;iCounter1<iplanes;iCounter1++)
{

    for(iCounter2=0;iCounter2<iRow;iCounter2++)
    {
        for(iCounter3=0;iCounter3<iColumn;iCounter3++)
        {
            printf("Enter[%d][%d][%]value\t")
            scanf("%d",&arr[iCounter1][iCounter2][iCounter3]);
        }
    }
}

    printf("Entered value are\n");
 for(iCounter1 = 0;iCounter1<iplanes;iCounter1++)
{

    for(iCounter2=0;iCounter2<iRow;iCounter2++)
    {
        for(iCounter3=0;iCounter3<iColumn;iCounter3++)
        {
            printf("[%d][%d][%d] value is %d",iCounter1,iCounter2,iCounter3,arr[iCounter1][iCounter2][iCounter3]);
       }
    }
}


    exit(0);
}

   for(iCounter1 = 0;iCounter1<iplanes;iCounter1++)
    {
        for(iCounter2 = 0;iCounter2<iRow;iCounter2++)
        {
            free(arr[iCounter1][iCounter2])
        }
        free(arr[iCounter1]);
    }

    free(arr);
    
    return(0);

}