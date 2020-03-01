%{
    #include<stdio.h>
    int cons = 0,vow = 0;
%}

%%
[AEIOUaeiou] {vow++;}
[A-Za-z] {cons++;}
. {;}
%%
int yywrap()
{
    return 1;
}

int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    printf("There are %d vowels and %d consonents in the file",vow,cons);
    return 0;
}