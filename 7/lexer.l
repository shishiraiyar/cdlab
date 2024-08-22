%{
#include "y.tab.h"

%}

letter [a-zA-Z_]
digit [0-9]

%%

("int"|"float"|"char"|"void") {ECHO; return TYPE;}

"return" {ECHO;  return RET;}

{digit}* {ECHO; return NUM;}

{letter}({letter}|{digit})* {ECHO; return IDEN;}

[ \t\n] ;
. {ECHO; return yytext[0];}
%%

