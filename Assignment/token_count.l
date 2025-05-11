%{
#include <stdio.h>
int token_count = 0;
%}

%%

EXIT             { return 0; }

int              { printf("Keyword: %s\n", yytext); token_count++; }
float            { printf("Keyword: %s\n", yytext); token_count++; }
return           { printf("Keyword: %s\n", yytext); token_count++; }

[a-zA-Z_][a-zA-Z0-9_]*   { printf("Identifier: %s\n", yytext); token_count++; }

[0-9]+               { printf("Number: %s\n", yytext); token_count++; }

[\+\-\*/=<>]         { printf("Operator: %s\n", yytext); token_count++; }

[(){};,]             { printf("Punctuation: %s\n", yytext); token_count++; }

[ \t\n]+             { /* skip whitespace */ }

.                    { printf("Unknown token: %s\n", yytext); token_count++; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter code or text (type EXIT to finish):\n");
    yylex();
    printf("Total number of tokens: %d\n", token_count);
    return 0;
}
