%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
extern FILE *yyin;
%}

%token NUM

%left '+' '-'
%left '*' '/'

%start line

%%

line
    : expr           { /* parsing successful */ }
    ;

expr
    : expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | NUM
    ;

%%

int main(void)
{
    yyin = fopen("expression.txt", "r");
    if (!yyin) {
        perror("expression.txt");
        return 1;
    }

    if (yyparse() == 0)
        printf("Valid expression\n");
    else
        printf("Invalid expression\n");

    fclose(yyin);
    return 0;
}

void yyerror(const char *s)
{
    /* YACC calls this on syntax error */
    /* We don't need the message 's', we just care about validity */
    /* printf("Error: %s\n", s);  // optional debug */
}

