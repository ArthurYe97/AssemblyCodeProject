#include <stdio.h>



long printStackVar(long rbp, int offset, char* name)
{
    long  addr = rbp - offset;
    long x = -1;
    asm("movq    (%1), %0;"
        :  "=r"(x)
        : "r"(addr)
        );
    printf("on stack %ld, offset %d,  %s is  %ld\n", rbp,  offset, name,x);
    return x;
}

long printStack(long rbp)
{
    long callerRBP = printStackVar(rbp, 0, "caller rbp");
    printStackVar(rbp, 8, "arr");
    printStackVar(rbp, 16, "size");
    printStackVar(rbp, 24, "left");
    printStackVar(rbp, 32, "right");
    printStackVar(rbp, 40, "comp");
    printStackVar(rbp, 48, "mid");
    printStackVar(rbp, 56, "left");
    return callerRBP;
}

/* Print three stack frames, of the three callers directly above.
 */
void print_stack()
{
    long rbp;
    asm("movq (%%rbp), %0;"
        :  "=r"(rbp));
    rbp = printStack(rbp);
    rbp = printStack(rbp);
    printStack(rbp);
}


