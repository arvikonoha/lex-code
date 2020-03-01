%{
    #include<stdio.h>
    int pi=0,ni=0,pfr=0,nfr=0;

%}
%%
[+]?[0-9]+ {pi++;}
[-][0-9]+ {ni++;}
[+]?[0-9]+\.[0-9]+ {pfr++;}
[-][0-9]+\.[0-9]+ {nfr++;}
%%
int yywrap(){
    return 1;
}
int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    printf("Positive integers %d\n",pi);
    printf("Negative integers %d\n",ni);
    printf("Positive fractions %d\n",pfr);
    printf("Negative fractions %d\n",nfr);
}