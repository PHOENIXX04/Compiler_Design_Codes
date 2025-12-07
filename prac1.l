%{
#include <stdio.h>

int line_count = 0;
int char_count = 0;
%}

%%

\n          { line_count++; char_count++; }
.           { char_count++; }

%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file provided as an argument
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error opening file");
        return 1;
    }

    yylex();

    printf("Number of lines: %d\n", line_count);
    printf("Number of characters: %d\n", char_count);

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}

