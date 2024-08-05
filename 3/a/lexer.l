%{
#include<stdio.h>
int commentCount = 0;

FILE *yyout;
//Notice the lack of \n at the end of the regex. That is because . does not match \n
%}
%%
\/\/.*\n {commentCount++;  }

. fprintf(yyout, "%s", yytext);
\n fprintf(yyout, "\n");

%%
int main(){
	yyin = fopen("input.c", "r");
	yyout = fopen("output.c", "w");

	yylex();
	printf("Number of comments: %d\n", commentCount);
	return 0;
}
