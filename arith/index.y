%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token NM NL
%left '+' '-' 
%left '*' '/' 
%%

S: E NL {printf("Valid expression\nResult is %d",$$);exit(0);}
;
E: E '+' E {$$=$1+$3;}| E '-' E {$$=$1-$3;}| E '*' E {$$=$1*$3;} | E '/' E {if($3 == 0){printf("Divisor can't be zero");exit(0);} $$=$1/$3;} | '(' E ')' {$$ = $2;} | NM {$$ = $1;} 

%%
int yyerror(char *msg){
    printf("Invalid expression\n");
    return 1;
}

int main(){
    printf("Enter the expression\n");
    yyparse();
    return 0;
}
