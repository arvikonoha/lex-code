%{
    #include<stdio.h>
    int smp = 1;
%}
%%

[ \n\t]+[bB][uU][tT][ \n\t]+ { smp=0;}
[ \n\t]+[oO][rR][ \n\t]+ { smp=0;}
[ \n\t]+[aA][nN][dD][ \n\t]+ { smp=0;}
. {;}

%%
int yywrap(){
    return 1;
}

int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    if(smp)
        printf("Statement is simple\n");
    else
        printf("Statement is complex\n");
    return 0;
}