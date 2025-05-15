%{
#include <stdio.h>
#include <stdlib.h>

// Declare the lexing function and error reporting function
int yylex();                      // Forward declaration
void yyerror(const char *s);       // Forward declaration
%}

// Define tokens
%token ID NUM STAR

%%
// Grammar rules

S   : L '=' R    { printf("Valid assignment\n"); }
    | R          { printf("Just a reference\n"); }
    ;

L   : STAR R     { printf("Pointer access\n"); }
    | ID         { printf("Identifier\n"); }
    | NUM        { printf("Number\n"); }
    ;

R   : L;  // Recursive rule

%%

// Error handling function
void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
