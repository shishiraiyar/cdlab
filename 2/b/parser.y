%{
#include<stdio.h>
#include<stdlib.h>
// They might ask u to ensure division by 0 doesnt happen and stuff like that
%}

%left '+' '-'
%left '*' '/'

%token NUM

%%
S : E {printf("Answer: %d\n", $1);}

E   : E '+' E {$$ = $1 + $3;}
	| E '-' E {$$ = $1 - $3;} 
	| E '*' E {$$ = $1 * $3;}
	| E '/' E {$$ = $1 / $3;}
	| NUM {$$ = $1;}
	;

%%

int yyerror(){
	printf("ERROR\n");
	exit(0);
}

int main(){
	printf("Enter the expression\n");
	yyparse();
	return 0;
}
