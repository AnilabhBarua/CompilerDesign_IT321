%{
#include <stdio.h>
int vowel_count = 0;
int consonant_count = 0;
%}

%%

EXIT            { return 0; }

[aAeEiIoOuU]    { 
    printf("Vowel: %s\n", yytext);
    vowel_count++;
}

[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] {
    printf("Consonant: %s\n", yytext);
    consonant_count++;
}

.|\n            {  }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (type EXIT to finish):\n");
    yylex();
    printf("\nTotal Vowels: %d\n", vowel_count);
    printf("Total Consonants: %d\n", consonant_count);
    return 0;
}
