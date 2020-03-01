%{
    #include<stdio.h>
    #include<string.h>
    int stk[50],top=-1,nopr=0,nopd=0,valid=1;;
    char opr[50][50],opd[50][50];
%}

%%
"{" {stk[++top]='{';}
"[" {stk[++top]='[';}
"(" {stk[++top]='(';}
"}" { if(stk[top--] != '{'){ valid=0; return 1; } }
"]" { if(stk[top--] != '['){ valid=0; return 1; } }
")" { if(stk[top--] != '('){ valid=0; return 1; } }
"+"|"-"|"/"|"*" {strcpy(opr[nopr++],yytext);}
[a-zA-Z][a-zA-Z0-9]*|[0-9]+ {strcpy(opd[nopd++],yytext);}
. {;}
%%

int yywrap(){
    return 1;
}

int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    if(!valid){
        printf("Invalid\n");
    } else {
        printf("Valid\n");
        printf("\nOperators\n");
        for(;nopr>=0;)
        {
            printf("%s\n",opr[--nopr]);
        }

        printf("Operands\n");
        for(;nopd>=0;)
        {
            printf("%s\n",opd[--nopd]);
        }
        
    }
}