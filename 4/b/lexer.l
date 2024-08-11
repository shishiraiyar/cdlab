%{
#include "y.tab.h"
%}

relop (\+|-|\*|\/|==|<|>|<=|>=|=)

digit [0-9]
letter [a-zA-Z_]

%%

if {return IF;}

-?{digit}+ {return NUM;}
{letter}({letter}|{digit})* {return IDEN;}

{relop} {return RELOP;}

[ \t\n] ;

. return yytext[0];
%%
