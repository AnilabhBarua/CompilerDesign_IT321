%{
#include <stdio.h>
int char_count = 0;
%}

%%

EXIT            { return 0; }

.               { char_count++; }

\n              { char_count++; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (type EXIT to finish):\n");
    yylex();
    printf("Total number of characters: %d\n", char_count);
    return 0;
}
