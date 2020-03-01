%{
    #include<stdio.h>
    int id = 0;
%}

%%
[a-zA-Z][a-zA-Z0-9]* {id++;}
. ;
%%
int yywrap(){
    return 1;
}
int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    printf("Number of identifiers %d\n",id);
    return 0;
}