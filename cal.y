%{
#include <stdio.h>
void yyerror(const char *s);
int yylex();
%}

%union{
    int type_int;
    double type_double;
}

%token <type_int> INT
%token <type_double> DOUBLE
%token ADD SUB MUL DIV LP RP EOL
%type <type_double> Exp Cal

%start Cal
%left ADD SUB
%left MUL DIV
%left LP RP

%%
Cal: Cal Exp EOL {
    printf("=%.3lf\n", $2);
    YYACCEPT;
    }
    | {}/*空字符不做任何事*/
    ;
Exp:DOUBLE {$$=$1;}
    |INT {$$=(double)$1;}
    |Exp ADD Exp {$$=$1+$3;}
    |Exp SUB Exp {$$=$1-$3;}
    |Exp MUL Exp {$$=$1*$3;}
    |Exp DIV Exp {$$=$1/$3;}
    |LP Exp RP {$$=$2;} /*注意此处，如果括号不做动作就会导致结果为零*/
    ;
%%
