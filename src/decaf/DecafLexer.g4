lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';
TRAÇO: '-';
VIRG: ',';
MAS: '+';
MULT: '*';
PONTVIR: ';';
LCOLCHE: '[';
RCOLCHE: ']';
OU: '||';
DOISIGUAL: '==';
MAISIGUAL: '+=';
MENOSIGUAL: '-=';
DOISPONT: ':';
IGUAL: '=';
DIF: '!=';
LPARENT: '(';
RPARENT: ')';
ECOMP: '&&';
COMPMENOR: '<';
COMPMAIOR: '>';
COMPMENORIGUAL: '<=';
COMPMAIORIGUAL: '>=';
PONTO: '.';
EXCLAM: '!';
BARRA: '/';
PORCENT: '%';

CALLOUT: 'callout';
CLASS: 'class';
ELSE: 'else';
BOOLEAN: 'boolean';
IF: 'if';
INT: 'int';
RETURN: 'return';
VOID: 'void';
FOR: 'for';
BREAK: 'break';
CONTINUE: 'continue';

CHAR : '\'' (ESC|ASC) '\'';
STRING : '"' (ESC|ASC)* '"';
NUMBER : '-'? [0-9]+;
BOOLEANLITERAL: ('false' | 'true');
HEXA: '0x'('A'..'F' | 'a'..'f' | '0'..'9')+;

fragment ESC :  '\\' ('n'|'"'| 't'| '\\'| '\'');
fragment ASC: [\u0020-\u0021|\u0023-\u0026|\u0028-\u005B|\u005D-\u007E];
fragment NUMB: ('0'..'9');
fragment MAIS: ('A'..'Z');
fragment MINUS: ('a'..'z');
fragment HEXALT: ('A' .. 'F'| 'a' ..'f')+;

ID  : ( MAIS | MINUS | '_')(MAIS | MINUS | '_' | NUMB)*;
WS_ : (' ' | '\n'| '\t') -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;
