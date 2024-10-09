%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct tableRow{
	char op;
	char *arg1, *arg2, *res;
};

struct tableRow table[100];
int tableIndex = 0;

char *addToTable(char op, char *arg1, char *arg2, char *res);
char *getTemporaryVariable();
void printTable();
void printThreeAddressCode();

extern FILE *yyin;
%}

%union{
	char *str;
}
%token <str> IDEN NUM
%type <str> EXP PROG

%left '='
%left '+' '-'
%left '*' '/'
%%

PROG : PROG EXP ';'
	 | EXP ';'
	 ;

EXP : EXP '+' EXP {$$ = addToTable('+', $1, $3, getTemporaryVariable());}
	| EXP '-' EXP {$$ = addToTable('-', $1, $3, getTemporaryVariable());}
	| EXP '*' EXP {$$ = addToTable('*', $1, $3, getTemporaryVariable());}
	| EXP '/' EXP {$$ = addToTable('/', $1, $3, getTemporaryVariable());}
	| IDEN '=' EXP {$$ = addToTable('=',"  " , $3, $1);}
	| IDEN {$$ = $1;}
	| NUM {$$ = $1;}
;

 

%%

int yyerror(char *msg){
	printf("%s", msg);
	exit(0);
}

int main(){
	yyin = fopen("input.c", "r");
	yyparse();
	printTable();
	printThreeAddressCode();
	return 0;
}

char *addToTable(char op, char *arg1, char *arg2, char *res){
	table[tableIndex].op = op;
	table[tableIndex].arg1 = strdup(arg1);
	table[tableIndex].arg2 = strdup(arg2);
	table[tableIndex].res = strdup(res);
	tableIndex++;
	return res;
}

char *getTemporaryVariable(){
	static int count = 1;
	// VERY IMPORTANT FOR THIS TO BE MALLOC. Or it gives seg fault.
	char *tempVar = malloc(4*sizeof(char)); 
	sprintf(tempVar, "t%d", count);
	count++;
	return tempVar;
}

void printTable(){
	printf("\n\nQuadruples\n");
	for (int i=0; i<tableIndex; i++){
		printf("%c %s %s %s\n", table[i].op, table[i].arg1, table[i].arg2, table[i].res );
	}
}

void printThreeAddressCode(){
	printf("\n\nThree Address Code\n");
	for (int i=0; i<tableIndex; i++){
		if (table[i].op == '=')
			printf("%s = %s\n", table[i].res, table[i].arg2);
		else
			printf("%s = %s %c %s\n", table[i].res, table[i].arg1, table[i].op, table[i].arg2);
	}

}
