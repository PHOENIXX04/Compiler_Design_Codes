%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
int yylex(void);
void yyerror(const char *s);
%}

%union {
    double val;
}

%token <val> NUM
%type  <val> expr     /* <<< THIS FIXES THE ERROR */

%left '+' '-'
%left '*' '/'

%start input

%%

input
    : expr               { printf("Result = %g\n", $1); }
    ;

expr
    : expr '+' expr      { $$ = $1 + $3; }
    | expr '-' expr      { $$ = $1 - $3; }
    | expr '*' expr      { $$ = $1 * $3; }
    | expr '/' expr      {
                            if ($3 == 0) {
                                yyerror("Division by zero");
                                YYABORT;
                            } else {
                                $$ = $1 / $3;
                            }
                         }
    | '(' expr ')'       { $$ = $2; }
    | NUM                { $$ = $1; }
    ;

%%

int main(void)
{
    yyin = fopen("expression.txt", "r");
    if (!yyin) {
        perror("expression.txt");
        return 1;
    }

    if (yyparse() != 0) {
        fprintf(stderr, "Invalid expression\n");
    }

    fclose(yyin);
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

