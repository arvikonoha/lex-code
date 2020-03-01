%{
    #include "y.tab.h"
%}
%%
"if" {return IF;}
"<"|">"|"<="|">="|"==" {return RELOP;}
[sS][0-9] {return ST;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[0-9]+ {return NM;}
\n {return NL;}
. {return yytext[0];}
%%
int yywrap()
{
    return 1;
}
