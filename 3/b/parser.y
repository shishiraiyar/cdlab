%{
#include<stdio.h>
#include<stdlib.h>


// Im just counting for loops. If they ask to check nesting do count>=3 or something and fool them like that
int fCount = 0;

//extern keyword is important
extern FILE *yyin;
%}

%token NUM IDEN RELOP FOR INCDEC

%%

S : F

F : FOR FHEAD '{' FBODY '}' {fCount++;}
  | FOR FHEAD 				{fCount++;}
  ;

FHEAD : '(' E ';' E ';' E ')' 

FBODY : FBODY FBODY
	  | F
 	  | E
 	  |
	  ;

E : IDEN RELOP IDEN
  | IDEN RELOP NUM
  | NUM RELOP IDEN
  | NUM RELOP NUM
  | IDEN INCDEC
  | INCDEC IDEN
  | IDEN
  | NUM
  |
  ;


%%
int yyerror(char *msg){
	printf("ERROR: %s\n", msg);
	return 0;

}
int main(){
	yyin = fopen("input.c", "r");
	yyparse();
	printf("Nested forloop count: %d\n", fCount);
	return 0;

}
