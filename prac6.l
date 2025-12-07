%{
#include <stdio.h>

int word_count = 0;
int char_count = 0;
int space_count = 0;
int line_count = 0;
%}

%%

[ \t]+      { 
                space_count += yyleng;
                char_count += yyleng;
            }

\n          { 
                line_count++; 
                char_count++; 
            }

[A-Za-z_0-9]+  {
                word_count++;
                char_count += yyleng;
            }

.           { 
                char_count++; 
            }

%%

int main() {
    yyin = fopen("code.txt", "r");
    if (!yyin) {
        perror("Could not open code.txt");
        return 1;
    }

    yylex();
    fclose(yyin);

    printf("Number of words: %d\n", word_count);
    printf("Number of characters: %d\n", char_count);
    printf("Number of blank spaces: %d\n", space_count);
    printf("Number of lines: %d\n", line_count);

    return 0;
}

int yywrap() {
    return 1;
}

