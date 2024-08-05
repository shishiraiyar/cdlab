%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"

%}

digit [0-9]
letter [a-zA-Z_]
relop (<|>|<=|>=|\+|-|\*|\/|==|=)


%%

for {return FOR;}

-?{digit}+ {return NUM;}
{letter}({letter}|{digit})* {return IDEN;} 

{relop} {return RELOP;}
(\+\+|--) {return INCDEC;}

[ \t\n] ;
. return yytext[0];
%%



