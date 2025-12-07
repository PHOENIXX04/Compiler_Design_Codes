%{
#include <stdio.h>

int vowels = 0;
int consonants = 0;
%}

%%

[aAeEiIoOuU]                    { vowels++; }
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] { consonants++; }
.                               ;   /* ignore other characters */

%%

int main() {

    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Could not open input.txt");
        return 1;
    }

    yylex();

    fclose(yyin);

    printf("Number of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);

    return 0;
}

int yywrap() {
    return 1;
}

