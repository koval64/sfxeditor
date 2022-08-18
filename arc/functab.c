#include <stdio.h>

void fa(char x, char y)
{
	printf("A %d %d\n", x, y);
}

void fb(char x, char y)
{
	printf("B %d %d\n", x, y);
}

void (*ftab[2])(char, char);

int main(void)
{
	ftab[0] = fa;
	ftab[1] = fb;

	ftab[0](1, 2);
	ftab[1](3, 4);

	for(char i=0; i<2; i++)
		(*ftab[i])(5, 6);

	return 0;
}
