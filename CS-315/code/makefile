all: parser flexer hi

parser: parser.y
	yacc parser.y -d -v 

flexer: scan.l
	lex scan.l


hi: lex.yy.c y.tab.c y.tab.h
	gcc y.tab.c lex.yy.c -o hi -lfl
	
clean:
	-rm lex.yy.c
	-rm y.tab.c
	-rm y.tab.h
	-rm hi.exe
