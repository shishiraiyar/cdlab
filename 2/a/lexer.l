%{
#include<stdio.h>
int positiveIntegers = 0, negativeIntegers = 0, positiveFractions = 0, negativeFractions = 0;
//This should be enough but if they're annoying they'll ask you to handle decimals as well
%}

digit [0-9]

positiveInteger \+?{digit}
negativeInteger -{digit}

%%
{positiveInteger} positiveIntegers++;
{negativeInteger} negativeIntegers++;

{positiveInteger}/{positiveInteger} positiveFractions++;
{negativeInteger}/{negativeInteger} positiveFractions++;

{positiveInteger}/{negativeInteger} negativeFractions++;
{negativeInteger}/{positiveInteger} negativeFractions++;

%%

int main(){
	yyin = fopen("numbers.txt", "r");
	yylex();
	printf("Positive integers: %d\nNegative integers: %d\nPositive Fractions: %d\nNegative Fractions: %d\n", positiveIntegers, negativeIntegers, positiveFractions, negativeFractions);
	return 0;

}

