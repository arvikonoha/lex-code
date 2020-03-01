%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token A B NL
%%
S: E NL {printf("Valid expression\n");exit(0);}
;
E: A E B | 
;
%%
int yyerror(){
    printf("Invalid expression\n");
    return 1;
}
int main(){
    printf("Enter the expression\n");
    yyparse();
    return 0;
}