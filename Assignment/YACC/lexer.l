%{
#include "parser.tab.h"  // Include the YACC header for token definitions
#include <stdio.h>
%}

%%

// Token patterns

"="           { return '='; }          // Assignment operator ( = )
"*"           { return STAR; }         // Dereference operator ( * )
[0-9]+        { return NUM; }          // Numeric literal (number)
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; } // Identifier (variable names)

[ \t\n]+      { /* Skip whitespace */ } // Ignore spaces, tabs, and newlines

.             { printf("Invalid character: %s\n", yytext); return 0; } // Handle invalid characters

%%

// This function is required by Lex to signal end of input.
int yywrap() {
    return 1; // Return 1 to indicate the end of input.
}
~