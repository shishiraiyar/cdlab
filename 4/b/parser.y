%{
#include<stdio.h>
#include<stdlib.h>

int ifCount = 0;
extern FILE *yyin;
%}

%token NUM IDEN RELOP IF

%%

program : ifstmt ;

ifstmt : IF '(' exp ')' '{' body '}'  {ifCount++;}
	   ;

body : body body
	 | ifstmt
	 | exp
	 | 
	 ;

exp : exp RELOP exp
    | IDEN
    | NUM
    ; 

%%

int yyerror(char *msg){
	printf("ERROR: %s\n", msg);
	exit(0);
}

int main(){
	yyin = fopen("input.c", "r");
	yyparse();	
	printf("If count: %d\n", ifCount);
	return 0;
}
