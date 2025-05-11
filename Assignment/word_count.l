%{
#include <stdio.h>
int word_count = 0;
%}

%%

^EXIT\n        { return 0; }  
[[:alnum:]]+   { word_count++; }  
[ \t\n]+       { /* skip whitespace */ }
.              { /* skip symbols */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (type EXIT to finish):\n");
    yylex();
    printf("Total number of words: %d\n", word_count);
    return 0;
}
