%{
#include <stdio.h>
%}

%%

^EXIT\n              { return 0; }  

[0-9]+               { printf("Number: %s\n", yytext); }
[\+\-\*/]            { printf("Operator: %s\n", yytext); }
[\(\)]               { printf("Parenthesis: %s\n", yytext); }
[ \t\n]+             {  }
.                    { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter arithmetic expressions (type EXIT to finish):\n");
    yylex();
    return 0;
}
