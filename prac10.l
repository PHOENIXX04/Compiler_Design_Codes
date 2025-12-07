%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+          {
                    yylval.val = atof(yytext);
                    return NUM;
                }

[ \t\r\n]+      { }

[+\-*/()]       { return yytext[0]; }

.               { return yytext[0]; }

%%

int yywrap() { return 1; }

