%{
    #include<stdio.h>
    int wrd=0,ln=0,sp=0,ch=0;
%}
%%
[^ \n\t\.,:]+ {wrd++;ch+=yyleng;}
[\n] {ln++;}
[ ] {sp++;}
. ;
%%
int yywrap(){
    return 1;
}

int main(int argc,char* argv[]){
    yyin = fopen(argv[1],"r");
    yylex();
    printf("Number of words %d\nNumber of charectors %d\nNumber of lines %d\nNumber of spaces %d\n",wrd,ch,ln,sp);
    return 0;
}