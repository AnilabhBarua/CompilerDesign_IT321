%{
int lines = 0, spaces = 0, words = 0, characters = 0;
#include <string.h>
%}

%%

^EXIT\n            { return 0; }                  // Exit input on 'EXIT'
[ \t]+             { spaces += yyleng; characters += yyleng; }
\n                 { lines++; characters++; }
[A-Za-z0-9]+       { words++; characters += yyleng; }
.                  { characters++; }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Lines      : %d\n", lines);
    printf("Spaces     : %d\n", spaces);
    printf("Words      : %d\n", words);
    printf("Characters : %d\n", characters);
    return 0;
}
