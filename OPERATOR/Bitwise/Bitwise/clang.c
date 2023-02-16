#include<stdio.h>
#include<stdlib.h>

int main()
{
    int n1;
    int n2;
    int res;


   
 
  printf("Enter the value of n1 and n2\n");
  scanf("%d%d",&n1,&n2);

   res = ~n1;
   
    printf("res = %d\n",res);

    res = n1 & n2;
    printf("res is %d\n",res);

    res = n1|n2;
    printf("res is %d\n",res);

    res = n1 ^ n2;
    printf("res is %d\n",res);


    res = n1 << 1;
    printf("res is %d\n",res);

    res = n2 >> 1;
    printf("res is %d\n",res);


    exit(0);


}

