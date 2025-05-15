%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token ID NUM STAR EQUAL

%%

S : L EQUAL R     { printf("S → L = R\n"); }
  | R             { printf("S → R\n"); }
  ;

L : STAR R        { printf("L → *R\n"); }
  | ID            { printf("L → id\n"); }
  | NUM           { printf("L → num\n"); }
  ;

R : L             { printf("R → L\n"); }
  ;

%%

void yyerror(const char *s) {
    printf("Syntax Error: %s\n", s);
}

int main() {
    printf("Enter input (end with 'EXIT'):\n");
    yyparse();
    return 0;
}
