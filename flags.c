/*
strldr.c 23.8.2023
Reads 1 integer value from the keyboard
Passes this integer to the function and gets the same value back
In case of an error the function gives a -1 back.
*/

#include <stdio.h>
#include <stdlib.h>


extern int flags_asm ( long long int val00, long long int val01, long long int *val02);

int main()
{
  long long int val2str00, val2str01, val2ldr;
  int error;	

  printf("Please give a number -> ");
  scanf("%lli", &val2str00);
  printf("Please give a number -> ");
  scanf("%lli", &val2str01);
  printf("The number: %lli\n", val2str00);
  printf("The number: %lli\n", val2str01);
  

  error = flags_asm(val2str00, val2str01, &val2ldr);	// calls the assembly program

  if(error == -1)
    printf("Error!\n");
  else
  {
    if(val2ldr == 42)
      printf("Value means argument 1 is positive, no overflow in addition: %lli\n", val2ldr);
    else if(val2ldr == 43)
      printf("Value means argument 1 is negative, no overflow in addition: %lli\n", val2ldr);
    else if(val2ldr == 52)
      printf("Value means argument 1 is positive, overflow in addition: %lli\n", val2ldr);
    else if(val2ldr == 53)
      printf("Value means argument 1 is negative, overflow in addition: %lli\n", val2ldr);
    else
      printf("Value is -> %lli\n", val2ldr);
  }

  return 0;
}
