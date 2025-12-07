%{
#include <stdio.h>
#include <string.h>

char longest[1024] = "";
%}

%%

[A-Za-z]+   {
                if (strlen(yytext) > strlen(longest)) {
                    strcpy(longest, yytext);
                }
            }

.|\n        { /* ignore everything else */ }

%%

int main() {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Could not open input.txt");
        return 1;
    }

    yylex();
    fclose(yyin);

    if (strlen(longest) > 0)
        printf("Longest word: %s\n", longest);
    else
        printf("No words found.\n");

    return 0;
}

int yywrap() { return 1; }

