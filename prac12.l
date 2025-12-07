%{
#include "y.tab.h"
%}

%%

"a"         { return 'a'; }
"b"         { return 'b'; }

[ \t\r\n]+  { /* ignore whitespace/newlines */ }

.           { return yytext[0]; }   /* any other char → parser error */

%%

int yywrap(void)
{
    return 1;
}

