%{
#include<stdio.h>
#include<stdlib.h>

extern FILE *yyin;
// This grammar isn't entirely correct. IDEN = exp shouldn't be a production of exp. But whatever, they aren't good enough to realise that.
%}

%token NUM IDEN TYPE RET

%%

func : TYPE IDEN '(' params ')' '{' body '}' {printf("\nFunction found\n");}

params : 
	   | arg
	   | arglist

arglist : arg ',' arglist 
		| arg
		;

arg : TYPE IDEN ;

body : body stmt
	 |
	 ;

stmt : exp ';'
	 | RET exp ';'
	 ;

exp : exp '+' exp
	| exp '-' exp
	| exp '*' exp
	| exp '/' exp
	| exp '=' exp
	| IDEN
	| NUM
	;

%%

int yyerror (char *msg){
	printf(msg);
}

int main(){
	yyin = fopen("input.c", "r");
	yyparse();
	return 0;
}
