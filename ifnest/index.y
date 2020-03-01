%{
    #include<stdio.h>
    int ifc = 0;
%}
%token IF ST RELOP NL NM ID
%%
S: IF_ST NL {printf("Valid expression\nNumber of if nests %d\n",ifc);exit(0);}
;
IF_ST: IF '(' COND ')' '{' IF_ST '}' {ifc++;} | ST
;
COND: X RELOP X
;
X: ID | NM
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