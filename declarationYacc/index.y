%{
    #include<stdio.h>
%}
%token ALPHA NUMBER NL
%%
S: ALPHA E NL {printf("Valid identifier\n");exit(0);}
;
E: ALPHA E | NUMBER E |
;
%%
int yyerror(){
    printf("Invalid indentifier\n");
    
    return 1;
}

int main(){
    printf("Enter the variable name\n");
    yyparse();
    return 0;
}