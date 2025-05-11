%{
#include <stdio.h>
#include <ctype.h>

int has_uppercase(const char *s) {
    while (*s) {
        if (isupper(*s))
            return 1;
        s++;
    }
    return 0;
}
%}

%%
[A-Za-z]+    { if (has_uppercase(yytext)) printf("%s\n", yytext); }
[\t\n ]+     ;
.            ;
%%

int main() {
    printf("Enter the string: \n");
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}
