%{
#include <stdio.h>
#include <string.h>

int valid = 1;          /* assume valid until proven otherwise */
int paren_stack = 0;    /* track parentheses */
%}

%%

[0-9]+                  { /* valid number */ }

[+\-*/]                 { /* valid operator */ }

"("                     { paren_stack++; }

")"                     { 
                            if (paren_stack == 0)
                                valid = 0;   /* extra closing ) */
                            else
                                paren_stack--;
                        }

[ \t\r\n]+              { /* ignore whitespace */ }

.                       { valid = 0; }   /* any illegal character */

%%

int main() {
    yyin = fopen("expression.txt", "r");
    if (!yyin) {
        perror("Cannot open expression.txt");
        return 1;
    }

    yylex();
    fclose(yyin);

    if (paren_stack != 0)
        valid = 0;   /* unmatched parentheses */

    if (valid)
        printf("Valid arithmetic expression\n");
    else
        printf("Invalid arithmetic expression\n");

    return 0;
}

int yywrap() { return 1; }

