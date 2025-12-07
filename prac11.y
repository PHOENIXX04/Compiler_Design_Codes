%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
int yylex(void);
void yyerror(const char *s);
%}

%start input

%%

input
    : s           { printf("Valid string\n"); }
    ;

s
    : 'a' 'b'           /* base case: "ab" */
    | 'a' s 'b'         /* recursive case: wrap with a...b */
    ;

%%

int main(void)
{
    yyin = fopen("lang1.txt", "r");
    if (!yyin) {
        perror("lang1.txt");
        return 1;
    }

    if (yyparse() != 0) {
        printf("Invalid string\n");
    }

    fclose(yyin);
    return 0;
}

void yyerror(const char *s)
{
    /* On any syntax error, yyparse() != 0 */
    /* We don't need to print s here */
}

