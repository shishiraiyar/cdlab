%{
#include<stdio.h>

int identifierCount=0; int operatorCount=0; int keywordCount=0;
%}
digit [0-9]
letter [a-zA-Z_]

identifier {letter}({letter}|{digit})*
keyword (int|float|char|double|for|while|if|const|static|switch|case|continue|break|return)
operator (\+|-|\*|\/|\+\+|--) 

%%

{keyword} keywordCount++;
{identifier} identifierCount++;
{operator} operatorCount++;

%%

int main(){
	yylex();
	printf("Identifier count: %d\nOperator count: %d\nKeyword count: %d\n", identifierCount, operatorCount, keywordCount);
	return 0;	
}
