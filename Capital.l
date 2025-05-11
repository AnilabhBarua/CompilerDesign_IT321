%{
#include<stdio.h>
%}

%%
[A-Z]+ {printf("%s\n", yytext);}
[\t\n]+ ;
. ;
%%

int main(){
    printf("Enter the string: \n");
    yylex();
}

int yywrap(void){
    return 1;
}