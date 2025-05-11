%{
#include <stdio.h>
int comment_lines = 0;
int in_multiline = 0;
%}

%%

^EXIT\n                 { return 0; }  // Stop input on EXIT

"//".*                  { comment_lines++; }

"/*"([^*]|\*+[^*/])*"\n"  { comment_lines++; in_multiline = 1; } 
"*/"                    { if (in_multiline) in_multiline = 0; }

.|\n                    { if (in_multiline && yytext[0] == '\n') comment_lines++; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter code (type EXIT to finish):\n");
    yylex();
    printf("Total commented lines: %d\n", comment_lines);
    return 0;
}
