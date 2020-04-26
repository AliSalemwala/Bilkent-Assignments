%option yylineno
%{
	#include "y.tab.h"
%}


ENTRYPOINT			drawboard
DRAW_COMMAND		draw
DIGIT				[0-9]
LETTER				[A-Za-z]

INT					({DIGIT})+
FLOAT				{DIGIT}*\.{DIGIT}+
STRING				\"[^\n\"]*\"
BOOL				true|false

DOT					\.
COMMA				\,
SEMICOLON			\;
COLON				\:
SINGLE_QUOTE		\'
DOUBLE_QUOTE		\"
WHITESPACE			[\ \t]
NEWLINE				\n
COMMENT				\/\/[^\n]*

ID					{LETTER}*("_"|{DIGIT}|{LETTER})+

ASSIGN_OP			=
ADD_OP				\+
SUBTRACT_OP			-
MULTIPLY_OP			\*
DIVIDE_OP			\/
INCR				\+\+
DECR				--
POWER_OP			\^
MODULUS_OP			\%
EQUAL				==
NOT_EQUAL			!=
LESS_THAN			<
GREATER_THAN		>
GREATER_THAN_EQUAL	>=
LESS_THAN_EQUAL		<=
NOT					!
AND					&&
OR					\|\|

OPEN_ROUND_BRACE	\(
OPEN_CURLY_BRACE	\{
OPEN_SQUARE_BRACE	\[
CLOSE_ROUND_BRACE	\)
CLOSE_CURLY_BRACE	\}
CLOSE_SQUARE_BRACE	\]

WHILE_KEYWORD		while
FOR_KEYWORD			for
IF_KEYWORD			if
ELSE_KEYWORD		else
RETURN_KEYWORD		return
DEFINE_KEYWORD		def
OPT_SPEC			OPTIONAL

RECTANGLE			Rectangle
OVAL				Oval
LINE				Line
TRIANGLE			Triangle
RHOMBUS				Rhombus
LINE_DIRECT			N|S|E|W|NE|NW|SE|SW
EXTEND				extend

LOC					Location
SIZE				Size
COLOR				Color
DEFAULT_COLORS		RED|BLUE|BLACK|WHITE|GREEN|YELLOW|TRANSPARENT

%s 					ENTERED

%%

<INITIAL>{ENTRYPOINT}			{BEGIN ENTERED; return ENTRYPOINT;}
<INITIAL>{COMMENT}				
<ENTERED>{	
	{DRAW_COMMAND}				return DRAW_COMMAND;
	{INT}						{yylval.i = atoi(yytext); return INT;}
	{FLOAT}						{yylval.f = atof(yytext); return FLOAT;}
	{STRING}					{yylval.s = yytext; return STRING;}
	{BOOL}						{yylval.b = atoi(yytext); return BOOL;}
	{DOT}
	{COMMA}						return COMMA;
	{SEMICOLON}					return SEMICOLON;
	{COLON}
	{SINGLE_QUOTE}
	{DOUBLE_QUOTE}
	{WHITESPACE}
	{NEWLINE}					{}
	{COMMENT}
	{WHILE_KEYWORD}				return WHILE_KEYWORD;
	{FOR_KEYWORD}				return FOR_KEYWORD;
	{IF_KEYWORD}				return IF_KEYWORD;
	{ELSE_KEYWORD}				return ELSE_KEYWORD;
	{RETURN_KEYWORD}			return RETURN_KEYWORD;
	{DEFINE_KEYWORD}			return DEFINE_KEYWORD;
	{RECTANGLE}					return RECTANGLE;
	{OVAL}						return OVAL;
	{LINE}						return LINE;
	{TRIANGLE}					return TRIANGLE;
	{RHOMBUS}					return RHOMBUS;
	{LINE_DIRECT}				return LINE_DIRECT;
	{EXTEND}					return EXTEND;
	{LOC}						return LOC;
	{SIZE}						return SIZE;
	{COLOR}						return COLOR;
	{DEFAULT_COLORS}			return DEFAULT_COLORS;
	{ID}						return ID;
	
	{ASSIGN_OP}					return ASSIGN_OP;
	{ADD_OP}					return ADD_OP;
	{SUBTRACT_OP}				return SUBTRACT_OP;
	{MULTIPLY_OP}				return MULTIPLY_OP;
	{DIVIDE_OP}					return DIVIDE_OP;
	{INCR}						return INCR;
	{DECR}						return DECR;
	{POWER_OP}					return POWER_OP;
	{MODULUS_OP}				return MODULUS_OP;
	{EQUAL}						return EQUAL;
	{NOT_EQUAL}					return NOT_EQUAL;
	{LESS_THAN}					return LESS_THAN;
	{GREATER_THAN}				return GREATER_THAN;
	{GREATER_THAN_EQUAL}		return GREATER_THAN_EQUAL;
	{LESS_THAN_EQUAL}			return LESS_THAN_EQUAL;
	{NOT}						return NOT;
	{AND}						return AND;
	{OR}						return OR;

	{OPEN_ROUND_BRACE}			return OPEN_ROUND_BRACE;
	{OPEN_CURLY_BRACE}			return OPEN_CURLY_BRACE;
	{OPEN_SQUARE_BRACE}			
	{CLOSE_ROUND_BRACE}			return CLOSE_ROUND_BRACE;
	{CLOSE_CURLY_BRACE}			return CLOSE_CURLY_BRACE;
	{CLOSE_SQUARE_BRACE}
}

%%

int yywrap(void){
	return 1;
}