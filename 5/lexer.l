%{
#include<stdio.h>
#include "y.tab.h"
%}

digit [0-9]
letter [a-zA-Z_]
number {digit}+

datatype (int|float|char|bool|double)
iden {letter}({letter}|{digit})*
%%

{datatype} {ECHO; return TYPE;}

{iden}(\[{number}\])* {ECHO; return VAR;}
{number} {ECHO; return NUM;} 
[ \t\n] ;
. {ECHO; return yytext[0];} 

%%


