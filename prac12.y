%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
int yylex(void);
void yyerror(const char *s);

int countPairs = 0;   /* number of a-b pairs (i.e., n) */
%}

%start input

%%

input
    : s
    ;

s
    : 'a' 'b'          { countPairs++; }
    | 'a' s 'b'        { countPairs++; }
    ;

%%

int main(void)
{
    yyin = fopen("lang2.txt", "r");
    if (!yyin) {
        perror("lang2.txt");
        return 1;
    }

    int res = yyparse();

    if (res == 0 && countPairs >= 10)
        printf("Valid string\n");
    else
        printf("Invalid string\n");

    fclose(yyin);
    return 0;
}

void yyerror(const char *s)
{
    /* suppress default error message */
    /* printf("Error: %s\n", s); */
}

