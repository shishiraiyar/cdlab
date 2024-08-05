%{
#include<stdio.h>
#include<stdlib.h>
%}

%%

S : A B 
  ;

A : 'a' A 'b'
  | 
  ;

B : 'b' B 'c'
  |
  ;

%%

int yyerror(){
	printf("INVALID INPUT\n");
	exit(0);
}

int main(){
	printf("Enter your input\n");
	yyparse();
	printf("Valid input\n");
	return 0;

}
