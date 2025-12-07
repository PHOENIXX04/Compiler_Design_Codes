%{
#include "y.tab.h"
%}

%%

[a-z]      { return LETTER; }
[0-9]      { return DIGIT; }

[ \t\r\n]+ { /* ignore whitespace */ }

.          { return yytext[0]; }   /* invalid input */

%%

int yywrap() { return 1; }

