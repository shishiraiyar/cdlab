%{
#include<stdio.h>
#include<stdlib.h>

int nestCount = 0;
int maxNestCount = 0;

int max(int a, int b){
	return (a > b ? a : b);
}
extern FILE *yyin;

// KNOWN ISSUE: Fails when there is an assignment in the body.
%}

%token NUM IDEN RELOP FOR INCDEC

%%

S : F

F : FOR {nestCount++;
		 maxNestCount = max(maxNestCount, nestCount);
		}
	FHEAD '{' FBODY '}' {nestCount--;}

  | FOR {nestCount++;
		 maxNestCount = max(maxNestCount, nestCount);
		}
	FHEAD {nestCount--;} 
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
	printf("Nested forloop count: %d\n", maxNestCount);
	return 0;

}
