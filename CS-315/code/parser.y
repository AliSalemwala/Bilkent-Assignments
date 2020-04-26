%start starter

%token ENTRYPOINT
%token DRAW_COMMAND
%token INT
%token FLOAT
%token STRING
%token BOOL
%token COMMA
%token SEMICOLON
%token ID
%token ASSIGN_OP
%token ADD_OP
%token SUBTRACT_OP
%token MULTIPLY_OP
%token DIVIDE_OP
%token INCR
%token DECR
%token POWER_OP
%token MODULUS_OP
%token EQUAL
%token NOT_EQUAL
%token LESS_THAN
%token GREATER_THAN
%token GREATER_THAN_EQUAL
%token LESS_THAN_EQUAL
%token NOT
%token AND
%token OR
%token OPEN_ROUND_BRACE
%token OPEN_CURLY_BRACE
%token CLOSE_ROUND_BRACE
%token CLOSE_CURLY_BRACE
%token WHILE_KEYWORD
%token FOR_KEYWORD
%token IF_KEYWORD
%token ELSE_KEYWORD
%token RETURN_KEYWORD
%token DEFINE_KEYWORD
%token OPT_SPEC
%token RECTANGLE
%token OVAL
%token LINE
%token TRIANGLE
%token RHOMBUS
%token LINE_DIRECT
%token EXTEND
%token LOC
%token SIZE
%token COLOR
%token DEFAULT_COLORS

%union{
	int i;
	char* s;
	float f;
	int b;
}

%{
	#include <stdio.h>
	int yylex(void);
	void yyerror (char* err);
	int yylineno;
	int isI = 0;
	int isB = 0;
	int isS = 0;
	int isF = 0;
%}

%%

starter:
	ENTRYPOINT OPEN_ROUND_BRACE term COMMA term CLOSE_ROUND_BRACE OPEN_CURLY_BRACE statementList CLOSE_CURLY_BRACE functionDefinition {if (isI != 1 && isF != 1) yyerror("Wrong type passed"); else printf("Drawboard.\n");}
	| starter SEMICOLON		{yyerror ("Extra semicolon");}
	;

statementList:
	| statement statementList
	;

statement:
	DRAW_COMMAND OPEN_ROUND_BRACE drawFuncTail CLOSE_ROUND_BRACE SEMICOLON				{printf("Draw Function.\n\n");}
	| EXTEND OPEN_ROUND_BRACE shape COMMA term COMMA term COMMA term COMMA shape COMMA term COMMA term COMMA term CLOSE_ROUND_BRACE SEMICOLON	{printf("Extend Function\n\n");}
	| assignment SEMICOLON
	| whileLoop																			{printf("While Loop.\n\n");}
	| forLoop																			{printf("For Loop.\n\n");}
	| ifCond																			{printf("If Condition.\n\n");}
	| RETURN_KEYWORD term SEMICOLON														{printf("Return.\n");}
	| error SEMICOLON																	{yyerror("help");}
	;

drawFuncTail:
	STRING COMMA term COMMA term
	| shape COMMA term COMMA term
	| STRING COMMA term COMMA term COMMA term
	| shape COMMA term COMMA term COMMA term
	| STRING COMMA term COMMA term COMMA term COMMA term
	| shape COMMA term COMMA term COMMA term COMMA term
	| STRING COMMA term COMMA term COMMA term COMMA term COMMA term
	| shape COMMA term COMMA term COMMA term COMMA term COMMA term
	;

shape:
	RECTANGLE OPEN_ROUND_BRACE term CLOSE_ROUND_BRACE							{if (isB != 1) yyerror("Wrong type passed"); else printf("Rectangle.\n");}
	| OVAL OPEN_ROUND_BRACE CLOSE_ROUND_BRACE									{printf("Oval.\n");}
	| LINE OPEN_ROUND_BRACE term COMMA LINE_DIRECT CLOSE_ROUND_BRACE			{if (isB != 1) yyerror("Wrong type passed"); else printf("Line.\n");}
	| TRIANGLE OPEN_ROUND_BRACE term COMMA term COMMA term CLOSE_ROUND_BRACE	{if (isI != 1 && isF != 1) yyerror("Wrong type passed"); else printf("Triangle.\n");}
	| RHOMBUS OPEN_CURLY_BRACE term COMMA term CLOSE_ROUND_BRACE				{if (isI != 1 && isF != 1) yyerror("Wrong type passed"); else printf("Rhombus.\n");}
	| ID OPEN_ROUND_BRACE paramList CLOSE_ROUND_BRACE							{printf("Custom Shape.\n");}
	;

selfChangers:
	INCR
	| DECR
	| ADD_OP ASSIGN_OP term
	| SUBTRACT_OP ASSIGN_OP term
	| DIVIDE_OP ASSIGN_OP term
	| MULTIPLY_OP ASSIGN_OP term
	;

assignment:
	ID ASSIGN_OP assignable														{printf("Assignment.\n");}
	| ID selfChangers															{printf("Assignment.\n");}
	;

assignable:
	operation
	| shape
	| LINE_DIRECT
	;

term:
	ID																			{isI = 1; isF = 1; isB = 1; isS = 1;}
	| INT																		{isI = 1; isF = 0; isB = 0; isS = 0;}
	| FLOAT																		{isI = 0; isF = 1; isB = 0; isS = 0;}
	| STRING																	{isI = 0; isF = 0; isB = 0; isS = 1;}
	| BOOL																		{isI = 0; isF = 0; isB = 1; isS = 0;}
	| NOT term
	| locationType
	| sizeType
	| colorType
	| OPEN_ROUND_BRACE operation CLOSE_ROUND_BRACE
	;

operation:
	term operationTail
	;

operationTail:
	| ADD_OP term operationTail
	| SUBTRACT_OP term operationTail
	| DIVIDE_OP term operationTail
	| MULTIPLY_OP term operationTail
	| MODULUS_OP term operationTail
	| POWER_OP term operationTail
	| AND term operationTail
	| OR term operationTail
	| GREATER_THAN term
	| GREATER_THAN_EQUAL term
	| LESS_THAN term
	| LESS_THAN_EQUAL term
	| EQUAL term
	| NOT_EQUAL term
	;

whileLoop:
	WHILE_KEYWORD OPEN_ROUND_BRACE operation CLOSE_ROUND_BRACE OPEN_CURLY_BRACE statementList CLOSE_CURLY_BRACE
	| WHILE_KEYWORD error CLOSE_CURLY_BRACE											{yyerror("Problem in whileLoop");}
	;

forLoop:
	FOR_KEYWORD OPEN_ROUND_BRACE assignment SEMICOLON operation SEMICOLON assignment CLOSE_ROUND_BRACE OPEN_CURLY_BRACE statementList CLOSE_CURLY_BRACE
	| FOR_KEYWORD error CLOSE_CURLY_BRACE											{yyerror("Problem in forLoop");}
	;

ifCond:
	IF_KEYWORD OPEN_ROUND_BRACE term CLOSE_ROUND_BRACE OPEN_CURLY_BRACE statementList CLOSE_CURLY_BRACE elseCond
	| IF_KEYWORD error CLOSE_CURLY_BRACE											{yyerror("Problem in if Condition");}
	;

elseCond:
	| ELSE_KEYWORD ifCond													{printf("Else If Condition");}
	| ELSE_KEYWORD OPEN_CURLY_BRACE statementList CLOSE_CURLY_BRACE			{printf("Else Condition\n\n");}
	;

functionDefinition:
	| DEFINE_KEYWORD ID OPEN_ROUND_BRACE paramList CLOSE_ROUND_BRACE OPEN_CURLY_BRACE statementList CLOSE_CURLY_BRACE functionDefinition		{printf("Function Declaration.\n\n");}
	;

paramList:
	| term remainingParams
	| OPT_SPEC paramList
	;
	
remainingParams:
	| COMMA paramList
	;

locationType:
	LOC OPEN_ROUND_BRACE term COMMA term CLOSE_ROUND_BRACE						{if (isI != 1 && isF != 1) yyerror("Wrong type passed"); else printf("Location.\n");}
	;

sizeType:
	SIZE OPEN_ROUND_BRACE term COMMA term CLOSE_ROUND_BRACE						{if (isI != 1 && isF != 1) yyerror("Wrong type passed"); else printf("Size.\n");}
	;
	
colorType:
	COLOR OPEN_ROUND_BRACE term COMMA term COMMA term CLOSE_ROUND_BRACE			{if (isI != 1) yyerror("Wrong type"); else printf("Color.\n");}
	| COLOR OPEN_ROUND_BRACE DEFAULT_COLORS CLOSE_ROUND_BRACE					{if (isI != 1) yyerror("Wrong type"); else printf("Color.\n"); }
%%

void yyerror (char* err){
	printf("%s... line: %d\n", err, yylineno);
}

int main(){
	yyparse();
	return 0;
}