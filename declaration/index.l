%{
    #include "y.tab.h"
%}
%%

"char" {return CHAR;}
"int" {return INT;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[ ] {return SP;}
\n {return NL;}
"," {return CM;}
";" {return SC;}

%%
int yywrap(){
    return 1;
}