%{
#include<stdio.h>

int lines=0, words=0, characters=0, spaces=0;
%}


%%


\n lines++;

\t spaces+=4;
[ ] spaces++;

[^ \t\n#]+ {words++; characters+=yyleng;}

# return 0;

%%

int main(){
	printf("Enter your input\n");
	yylex();
	printf("Lines: %d\nWords: %d\nCharacters: %d\nSpaces: %d\n", lines, words, characters, spaces);
	return 0;
}



