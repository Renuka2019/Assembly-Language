#include<stdio.h>
#includ<stdlib.h>


int main()
{
    int arr[3][2][4] = {10,20,30,50,60,70,80,90};

    printf("&arr = %d\n",&arr);
    printf("arr = %d\n",arr);
    printf("arr[0]= %d\n",arr[0]);
    printf("arr[0][0][0] = %d\n",arr[0][0][0]);
    printf("arr[1] = %d\n",arr[1]);
   "arr[1][0] = %d\n"
   "arr[1][0][0] = %d\n"
   "arr[2] = %d\n"
   "arr[2][0] = %d\n"
   "arr[2][0][0] = %d\n"
   "&arr+1 = %d\n"
   "arr+1 = %d\n"
   "arr[0]+1 = %d\n"
   "arr[0][0]+1 = %d\n"
   "arr[0][0][0]+1 = %d\n"
   "*arr = %d\n"
   "**arr = %d\n"
   "***arr = %d\n"
   "*(*(*(arr+0)+1)+2) = %d\n"
   "*(*(*(arr+1)+0)+1) = %d\n"

}