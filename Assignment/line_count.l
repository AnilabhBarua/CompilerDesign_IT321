%{
#include <stdio.h>
int line_count = 0;
%}

%%

EXIT             { return 0; }

\n               { line_count++; }

.                { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (type EXIT to finish):\n");
    yylex();
    printf("Total number of lines: %d\n", line_count);
    return 0;
}
