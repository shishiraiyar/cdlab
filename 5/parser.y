%{
#include<stdio.h>
#include<stdlib.h>
int declCount =0;
%}
%token TYPE VAR NUM
%%

decl : TYPE variables ';'
	 ;

variables : variables ',' variables 
		  | VAR {declCount++;}
		  | VAR '=' NUM {declCount++;}
		  ; 

%%

int yyerror(char *msg){
	printf("%s", msg);
}

int main(){
	yyparse();
	printf("\nDecl count: %d\n", declCount);
	return 0;
}
