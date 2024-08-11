%{
#include "y.tab.h"
// ECHO just helps with debugging. Dont worry about it.
%}

digit [0-9]
letter [a-zA-Z_]

%%

{letter}({letter}|{digit})* {ECHO; yylval.str=strdup(yytext); return IDEN;}

{digit}+ {ECHO; yylval.str=strdup(yytext); return NUM; }

[ \t\n] ;

. {ECHO; return yytext[0];}


