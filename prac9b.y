%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
int yylex(void);
void yyerror(const char *s);
%}

%token LETTER DIGIT

%%

start
    : LETTER DIGIT    { printf("Valid variable\n"); }
    | /* empty */     { /* prevents syntax error from empty file */ }
    ;

%%

int main() {
    yyin = fopen("var.txt", "r");
    if (!yyin) {
        perror("var.txt");
        return 1;
    }

    if (yyparse() != 0)
        printf("Invalid variable\n");

    fclose(yyin);
    return 0;
}

void yyerror(const char *s) {
    /* Do not print yacc's default message */
}

