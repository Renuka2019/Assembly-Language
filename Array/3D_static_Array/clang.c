#include<stdio.h>
#include<srdlib.h>

#define MAX 50
#define MAX2 5

int main(void)
{
  int iPlanes;
  int iRows;
  int iColumn;
  int iCounter1;
  int iCounter2;
  int iCounter3;

  int arr[MAX][MAX2][MAX2];

  printf("Enter values of planes,rows, colums");
  scanf("%d%d%d",&iPlanes,&iRows,&iColumn);

  for(iCounter1 =0;iCounter1<iPlanes;iCounter1++)
  {
      for(iCounter2 = 0;iCounter2< iRows;iCounter2++)
      {
          for(iCounter2 = 0;iCounter2< iRows;iCounter2++)
          {
              printf("Enter [%d][%d][%d] value\t",iCounter1,iCounter2,iCounter3);
              scanf("%d",&arr[iCounter1][iCounter2][iCounter3]);
          }

      }
  }


  printf("Entered elements are\n:")

  for(iCounter1 = 0;iCounter1<iPlanes;iCounter1++)
  {
      for(iCounter2 = 0;iCounter2< iRows;iCounter2++)
      {
          for(iCounter2 = 0;iCounter2< iRows;iCounter2++)
          {
              printf("[%d][%d][%d] value is\t%d\n",arr[iCounter1][iCounter2][iCounter3]);
          }

      }
  }



exit(0)




}