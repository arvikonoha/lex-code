%{
    #include<stdio.h>
    int comm = 0;
%}
%s COMMENT
%%
"/*" {BEGIN COMMENT;}
"//".*\n {comm++;}
<COMMENT>\n {comm++;}
<COMMENT>. {;}
<COMMENT>"*/" {comm++; BEGIN 0;}
. {fprintf(yyout,yytext);}
%%
int yywrap()
{
    return 1;
}
int main(int arc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    printf("Number of comments in %d\n",comm);
    return 0;
}