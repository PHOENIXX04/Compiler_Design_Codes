%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+          { return NUM; }

[ \t\r\n]+      { /* ignore whitespace */ }

[+\-*/()]       { return yytext[0]; }

.               { /* any other character is invalid */
                  return yytext[0];
                }

%%

int yywrap(void)
{
    return 1;
}

