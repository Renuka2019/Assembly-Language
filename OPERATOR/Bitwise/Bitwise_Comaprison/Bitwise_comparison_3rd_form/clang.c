//********************************************************************************************************
//
//  program       :  To accept two numbers from user check relational operation using bitwise operator
//
//********************************************************************************************************
#include<stdio.h>
#include<stdlib.h>

//
//macros
//
#define LESS_THAN_EQUAL_EQUAL_GREATER_THAN_EQUAL 14
#define LESS_THAN_LESS_THAN_EQUAL 3
#define GREATER_THAN_EQUAL_GREATER_THAN 22
#define LESS_THAN_LESS_THAN_EQUAL_EQUAL_GREATER_THAN_EQUAL_GREATER_THAN 31

//
// global function declaration
//
char Comparison(int, int);

int main(void)
{
    //
    //local variable definition
    //
    int iNo1;
    int iNo2;
    char chAns;

    printf("Enter value of iNo1 and iNo2\n");
    scanf("%d%d",&iNo1,&iNo2);

    //
    // function call
    // 
    chAns = Comparison(iNo1,iNo2);

    chAns =  chAns & LESS_THAN_LESS_THAN_EQUAL_EQUAL_GREATER_THAN_EQUAL_GREATER_THAN;
  
   if(chAns  == LESS_THAN_LESS_THAN_EQUAL) 
   {
       printf("%d is less than %d \n",iNo1,iNo2);
       printf("%d is less than equal to %d \n",iNo1,iNo2);
       printf("%d is not equal to %d \n",iNo1,iNo2);
       printf("%d is not greater than equal to %d \n",iNo1,iNo2);
       printf("%d is not greater than %d \n",iNo1,iNo2);
         
   }
   else if(chAns  == GREATER_THAN_EQUAL_GREATER_THAN)
   {
       printf("%d is not less than %d \n",iNo1,iNo2);
       printf("%d is not less than equal to %d \n",iNo1,iNo2);
       printf("%d is not equal to %d \n",iNo1,iNo2);
       printf("%d is greater than equal to %d \n",iNo1,iNo2);
       printf("%d is greater than %d \n",iNo1,iNo2);       
         
   }

   else if(chAns  == LESS_THAN_EQUAL_EQUAL_GREATER_THAN_EQUAL)
   {
       printf("%d is not less than %d \n",iNo1,iNo2);
       printf("%d is less than equal to  %d \n",iNo1,iNo2);
       printf("%d is equal to %d \n",iNo1,iNo2);
       printf("%d is greater than equal to %d \n",iNo1,iNo2);
       printf("%d is not greater than %d \n",iNo1,iNo2);
       
         
   }
    
     exit(0);
}

//*****************************************************************************************************
//  Name       : Comparison
//  parameter  : int iNo1 (in parameter) ,int iNo2 (in parameter) , char* pchAns(out parameter)
//            
// description : function accepts two number and check relational operation using bitwise operator  
//              
//  
//****************************************************************************************************

char Comparison(int iNo1,int iNo2)
{
    char chAns;
    (chAns) = (chAns) ^ (chAns);
   
    if(iNo1 == iNo2)
    {
        (chAns) = (chAns) |LESS_THAN_EQUAL_EQUAL_GREATER_THAN_EQUAL;
    }
   else if(iNo1<iNo2)
    {
       (chAns) = (chAns) | LESS_THAN_LESS_THAN_EQUAL;    
    }  
   else if(iNo1>iNo2)
    {
        (chAns) = (chAns) |GREATER_THAN_EQUAL_GREATER_THAN;    
    }
    return(chAns);    

}