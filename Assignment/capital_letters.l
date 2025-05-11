%{
#include <stdio.h>
int count = 0;
%}

%%

^EXIT\n        { return 0; }  // Type EXIT to end input
[A-Z]          { 
    printf("Capital letter found: %s\n", yytext); 
    count++;
}
.|\n           { /* Ignore all other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (type EXIT to finish):\n");
    yylex();
    printf("Total capital letters: %d\n", count);
    return 0;
}
