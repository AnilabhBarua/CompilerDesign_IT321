%{
 #include<stdio.h>
 int nc=0;
%}

%%
"/*"[a-zA-Z0-9 \t\n]*"*/" {nc++;}
"//"[a-zA-Z0-9 \t\n]*"\n" {nc++;}
%%

int main(int argc, char* argv){
    if(argc==2){
        yyin=fopen(argv[1], "r");
    }
    else{
        printf("enter the input: \n");
        yyin=stdin;
    }
    yylex();
    printf("Nos of comment lines are: %d",nc);
}

int yywrap(){
    return 1;
}