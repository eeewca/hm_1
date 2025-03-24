%{
#include <stdio.h>
#include <stdlib.h>
#include "cal.tab.h"
char *end;
%}
/*0-9的一个数字*/
digit [0-9]
/*常数*/
integer {digit}+
/*浮点数*/
floating {digit}+(\.{digit}+)?([eE][+-]?{digit}+)? 



%% /*检测数字格式，赋值*/
{integer} {
    yylval.type_int=atoi(yytext);
    /*printf("atoi匹配的数字: %d\n",yylval.type_int);*/
    return INT;
}
{floating} {
    yylval.type_double=strtod(yytext, &end);
    /*printf("strtod匹配的数字: %lf\n",yylval.type_double);*/
    return DOUBLE;
}
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"(" {return LP;}
")" {return RP;}
\n      { return EOL; }
[ \t\r]   { /* 忽略空白字符 */ }
.       { printf("Mystery character %c\n", *yytext); }
%%

int main(int argc, char **argv)
{
    /*yylex();   重点！！！！有这行代码就会导致语法错误*/
/*Bison 自动在解析过程中调用 yylex() 来获取下一个词法单元（Token）。
如果在 main() 函数中提前调用一次 yylex()，它会在正式解析前消耗掉一个 Token，导致解析阶段丢失第一个符号。*/

    /*yydebug=1;*/

    /*printf("strtod没能匹配的字符: %s\n",end);*/
    yyparse();
    return 0;
}
void yyerror(const char *msg)
{
    printf("Syntactical Error.(%s, %s)\n", msg, yytext);
}
int yywrap(){
    return 1;
}