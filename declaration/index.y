%{
    #include<stdio.h>
%}
%token ID NL CM SP CHAR INT SC
%%
S: TYPE SP LIST SC NL {printf("Valid declaration\n");exit(0);}
;
TYPE: CHAR | INT
;
LIST: ID CM LIST | ID CM SP LIST | ID SP CM LIST | ID SP CM SP LIST | ID
;
%%
int yyerror(){
    printf("Invalid declaration");
    return 1;
}

int main(int argc,char* argv[])
{
    printf("Enter the expression\n");
    yyparse();
    return 0;
}