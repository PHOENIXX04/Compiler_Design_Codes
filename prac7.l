%{
#include <stdio.h>
#include <string.h>

char str[100];
%}

%%

[a-zA-Z]+   {
                strcpy(str, yytext);   /* store the input string */
            }

.|\n        ;   /* ignore everything else */

%%

int yywrap(void) { return 1; }

int main(void)
{
    /* Open input.txt instead of reading from keyboard */
    yyin = fopen("string.txt", "r");
    if (!yyin) {
        perror("Cannot open string.txt");
        return 1;
    }

    yylex();  /* read the string from input.txt */
    fclose(yyin);

    int len = strlen(str);

    /* Print decreasing prefixes */
    for (int i = len; i > 0; i--) {
        for (int j = 0; j < i; j++)
            printf("%c", str[j]);
        printf("\n");
    }

    return 0;
}

