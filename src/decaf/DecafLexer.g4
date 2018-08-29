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

ID  :
  ('a'..'z' | 'A'..'Z')+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|ASC) '\'';
STRING : '"' (ESC|ASC)* '"';
NUMBER : '-'? [0-9]+;
OPERATORS: ( '+' | '-' |'*' |'<' |'<=' | '!=' | '&&');

fragment
ESC :  '\\' ('n'|'"'| 't'| '\\'| '\'');

fragment
ASC: [\u0020-\u0021|\u0023-\u0026|\u0028-\u005B|\u005D-\u007E];
