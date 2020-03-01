%{
    #include "y.tab.h"
%}
%%
[a-zA-Z]+ {return ALPHA;}
[0-9]+ {return NUMBER;}
\n {return NL;}
%%
int yywrap(){
    return 1;
}