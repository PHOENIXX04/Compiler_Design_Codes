%{
#include <stdio.h>

FILE *out;   // output will be printed to stdout
%}

%%

[a-z]  {
            /* shift lowercase letters */
            char c = yytext[0] + 3;
            if (c > 'z') c -= 26;
            fprintf(out, "%c", c);
       }

[A-Z]  {
            /* shift uppercase letters */
            char c = yytext[0] + 3;
            if (c > 'Z') c -= 26;
            fprintf(out, "%c", c);
       }

.      {
            /* print non-letters unchanged */
            fprintf(out, "%s", yytext);
       }

%%

int main() {

    yyin = fopen("text.txt", "r");
    if (!yyin) {
        perror("Could not open text.txt");
        return 1;
    }

    out = stdout;

    yylex();

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}

