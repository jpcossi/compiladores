parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}


program: CLASS id LCURLY field* method* RCURLY;

field: (type id (VIRG type id)*
     | type id LCOLCHE int_literal RCOLCHE (VIRG LCOLCHE int_literal RCOLCHE)*)PONTVIR;

method: (type | VOID) method_name LPARENT (type id (VIRG type id)*)? RPARENT block;

type: INT | BOOLEAN;

block: LCURLY var_decl* stat* RCURLY;

var_decl: (type id(type id)*) PONTVIR;

stat: location assign_op expr PONTVIR
                            | method_call PONTVIR
                            | IF LPARENT expr RPARENT block (ELSE block)?
                            | FOR id IGUAL expr VIRG expr block
                            | RETURN (expr)? PONTVIR
                            | BREAK PONTVIR
                            | CONTINUE PONTVIR
                            | block;

assign_op: IGUAL | MAISIGUAL | MENOSIGUAL;

method_name: id;

method_call: method_name LPARENT (expr(VIRG expr)*)? RPARENT
          | CALLOUT LPARENT string_literal ( VIRG callout_arg (VIRG callout_arg)*)? RPARENT;

location: id | id LCOLCHE expr RCOLCHE;

expr: location | method_call | literal | expr bin_op expr
| TRAÇO expr
| EXCLAM expr
| LPARENT expr RPARENT;

callout_arg: expr | string_literal;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: TRAÇO | MAS | BARRA | MULT | PORCENT;

rel_op: COMPMENOR | COMPMAIOR | COMPMAIORIGUAL | COMPMENORIGUAL;

eq_op: DOISIGUAL | DIF;

cond_op: ECOMP | OU;

literal: int_literal | char_literal | bool_literal;

id: ID;

alpha_num: alpha | digit;

alpha: MAIS;

digit: NUMB;

hex_digit: digit HEXALT;

int_literal: decimal_literal | hex_literal;

decimal_literal: NUMBER;

hex_literal: HEXA;

bool_literal: BOOLEANLITERAL;

char_literal: CHAR;

string_literal: STRING;
