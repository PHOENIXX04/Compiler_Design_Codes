%{
#include <stdio.h>
#include <string.h>

int is_keyword(const char *s) {
    const char *kw[] = {"if","else","while","for","return","int","float","double","char","void"};
    int i;
    for (i = 0; i < 10; i++)
        if (strcmp(s, kw[i]) == 0) return 1;
    return 0;
}
%}

%%

"//"[^\n]*              { printf("COMMENT: %s\n", yytext); }

[ \t\r\n]+              { /* skip whitespace */ }

[0-9]+\.[0-9]+          { printf("FLOAT: %s\n", yytext); }

[0-9]+                  { printf("INTEGER: %s\n", yytext); }

[A-Za-z_][A-Za-z0-9_]*  {
                          if (is_keyword(yytext))
                              printf("KEYWORD: %s\n", yytext);
                          else
                              printf("IDENTIFIER: %s\n", yytext);
                        }

"=="                    { printf("OPERATOR: %s\n", yytext); }
"!="                    { printf("OPERATOR: %s\n", yytext); }
"<="                    { printf("OPERATOR: %s\n", yytext); }
">="                    { printf("OPERATOR: %s\n", yytext); }
"++"                    { printf("OPERATOR: %s\n", yytext); }
"--"                    { printf("OPERATOR: %s\n", yytext); }

[+\-*/%=<>(){};:,]      { printf("OPERATOR: %s\n", yytext); }

.                       { printf("UNKNOWN: %s\n", yytext); }

%%

int main() {
    yyin = fopen("code.txt", "r");
    if (!yyin) {
        perror("code.txt");
        return 1;
    }
    yylex();
    fclose(yyin);
    return 0;
}

int yywrap() { return 1; }

