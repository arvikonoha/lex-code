%{
    #include<stdio.h>
    #include<stdlib.h>
    int sc=0,pr=0;
%}
%%

"scanf" {sc++;fprintf(yyout,"read");}
"printf" {pr++;fprintf(yyout,"write");}
. {fprintf(yyout,yytext);}
%%

int yywrap(){
    return 1;
}

int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yyout = fopen(argv[2],"w");
    yylex();
    printf("Number of printf is %d\nNumber of scanf is %d\n",pr,sc);
    return 0;
}