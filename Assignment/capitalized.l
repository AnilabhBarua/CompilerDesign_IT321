%{
#include <stdio.h>
#include <string.h>

%}

%%

^EXIT\n                { return 0; } 
[A-Z][a-zA-Z]*         { printf("Capitalized word found: %s\n", yytext); }
.|\n                   { /* Ignore all other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (type EXIT to finish):\n");
    yylex();
    return 0;
}
