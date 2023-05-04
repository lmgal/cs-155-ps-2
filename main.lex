COMMENT \/\/[^\n]*
KEYWORD go[ ]to|exit|if|then|else|case|endcase|while|do|endwhile|repeat|until|loop|forever|for|to|by|endfor|input|output|array|node|call|return|stop|end|procedure|log2
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
LITERAL (-?[0-9]+\.?[0-9]*|'[^']*')
PUNCTUATOR [();:,\[\]]
OPERATOR (=|\+|-|\/|\*|\^|and|or|not|<|>|<=|>=|!=|mod)
%%
{COMMENT} { /* ignore comments */ }
{KEYWORD} { printf("KEYWORD: %s\n", yytext); }
{IDENTIFIER} { printf("IDENTIFIER: %s\n", yytext); }
{LITERAL} { printf("LITERAL: %s\n", yytext); }
{PUNCTUATOR} { printf("PUNCTUATOR: %s\n", yytext); }
{OPERATOR} { printf("OPERATOR: %s\n", yytext); }
[ \t\n]+ { /* ignore whitespace */ }
. { printf("ERROR: %s\n", yytext); }
%%
int main(int argc, char **argv)
{
    yyin = fopen(argv[1], "r");
    yylex();
    return 0;
}
