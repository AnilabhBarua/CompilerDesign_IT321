%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);  // Declare the error function here (to avoid conflicting with Flex)
%}

%token type ID

%%

D : T L ;  // Fixed the syntax error (removed extra quotes)
T : type ;  // T is defined as int or float
L : L ',' ID  // L can be a list of IDs separated by commas
  | ID ;  // Or just a single ID

%%

int main() {
    printf("Enter the expression for the grammar:\n");
    yyparse();  // Call the parser
    printf("Valid Expression\n");
    return 0;
}

void yyerror(const char *s) {
    printf("\nSyntax Error!\n");  // Print error message for syntax errors
}
