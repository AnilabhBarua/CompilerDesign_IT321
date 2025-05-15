%{
#include "parser.tab.h"
%}

%%

"EXIT"         { exit(0); }
[ \t\n]+       ; // Skip whitespace
"="            { return EQUAL; }
"*"            { return STAR; }
[0-9]+         { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }

.              { return yytext[0]; }

%%
