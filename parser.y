%{
#include<bits/stdc++.h>
using namespace std;
int yylex();
void yyerror(const char* buf);
int lineno = 1;
%}
%token NEWLINE
%token LONG_DOUBLE CHAR SHORT_INT LONG_LONG_INT LONG_INT INT UNSIGNED_CHAR UNSIGNED_SHORT_INT UNSIGNED_LONG_LONG_INT UNSIGNED_LONG_INT UNSIGNED_INT BOOL DOUBLE FLOAT VOID CHAR16_T CHAR32_T WCHAR_T
%token ALIGNAS ALIGNOF AND ASM ATOMIC_CANCEL ATOMIC_COMMIT ATOMIC_NOEXCEPT AUTO BREAK CASE CATCH CLASS COMPL CONCEPT CONST CONSTEXPR CONST_CAST CONTINUE CO_AWAIT CO_RETURN CO_YIELD DECLTYPE DEFAULT DELETE DO DYNAMIC_CAST ELSE ENUM EXPLICIT EXPORT EXTERN FALSE FOR FRIEND GOTO IF IMPORT INLINE MODULE MUTABLE NAMESPACE NEW NOEXCEPT NULLPTR OPERATOR OR PRIVATE PROTECTED PUBLIC REFLEXPR REGISTER REINTERPRET_CAST REQUIRES RETURN SIZEOF STATIC STATIC_ASSERT STATIC_CAST STRUCT SWITCH SYNCHRONIZED TEMPLATE THIS THREAD_LOCAL THROW TRUE TRY TYPEDEF TYPEID TYPENAME UNION USING VIRTUAL VOLATILE WHILE
%token IDENTIFIER CONSTANT STRING_LITERAL
%token ELIF ENDIF IFDEF IFNDEF DEFINE UNDEF INCLUDE LINE ERROR PRAGMA DEFINED
%token ELLIPSIS MEMBER_ACCESS MEMBER_ACCESS_POINTER SCOPE_RESOLUTION NOT_EQ NOT BITNOT LOGIC_OR OR_EQ BITOR LOGIC_AND AND_EQ BITAND XOR_EQ XOR MULTIPLY_EQ MULTIPLY INCREMENT ADD_EQ ADD DECREMENT SUBTRACT_EQ SUBTRACT DIVIDE_EQ DIVIDE MOD_EQ MOD RELATIONAL_ASSIGNMENT ASSIGNMENT LEFT_SHIFT_EQ LEFT_SHIFT LESS_EQ LESS RIGHT_SHIGT_EQ RIGHT_SHIFT GREATER_EQ GREATER DOUBLE_QUOTATION HASH DOLLAR APOSTROPHE FIRST_BRACKET_START FIRST_BRACKET_END COMMA COLON SEMICOLON QUESTION AT SQUARE_BRACKET_START SQUARE_BRACKET_END BACKSLASH UNDERSCORE GRAVE BRACES_START BRACES_END OTHER 

%%

doc: doc NEWLINE { lineno ++; }
| doc LONG_DOUBLE { printf("%d %d ", LONG_DOUBLE, lineno); }
| doc CHAR { printf("%d %d ", CHAR, lineno); }
| doc SHORT_INT { printf("%d %d ", SHORT_INT, lineno); }
| doc LONG_LONG_INT { printf("%d %d ", LONG_LONG_INT, lineno); }
| doc LONG_INT { printf("%d %d ", LONG_INT, lineno); }
| doc INT { printf("%d %d ", INT, lineno); }
| doc UNSIGNED_CHAR { printf("%d %d ", UNSIGNED_CHAR, lineno); }
| doc UNSIGNED_SHORT_INT { printf("%d %d ", UNSIGNED_SHORT_INT, lineno); }
| doc UNSIGNED_LONG_LONG_INT { printf("%d %d ", UNSIGNED_LONG_LONG_INT, lineno); }
| doc UNSIGNED_LONG_INT { printf("%d %d ", UNSIGNED_LONG_INT, lineno); }
| doc UNSIGNED_INT { printf("%d %d ", UNSIGNED_INT, lineno); }
| doc BOOL { printf("%d %d ", BOOL, lineno); }
| doc DOUBLE { printf("%d %d ", DOUBLE, lineno); }
| doc FLOAT { printf("%d %d ", FLOAT, lineno); }
| doc VOID { printf("%d %d ", VOID, lineno); }
| doc CHAR16_T { printf("%d %d ", CHAR16_T, lineno); }
| doc CHAR32_T { printf("%d %d ", CHAR32_T, lineno); }
| doc WCHAR_T { printf("%d %d ", WCHAR_T, lineno); }
| doc ALIGNAS { printf("%d %d ", ALIGNAS, lineno); }
| doc ALIGNOF { printf("%d %d ", ALIGNOF, lineno); }
| doc AND { printf("%d %d ", AND, lineno); }
| doc ASM { printf("%d %d ", ASM, lineno); }
| doc ATOMIC_CANCEL { printf("%d %d ", ATOMIC_CANCEL, lineno); }
| doc ATOMIC_COMMIT { printf("%d %d ", ATOMIC_COMMIT, lineno); }
| doc ATOMIC_NOEXCEPT { printf("%d %d ", ATOMIC_NOEXCEPT, lineno); }
| doc AUTO { printf("%d %d ", AUTO, lineno); }
| doc BREAK { printf("%d %d ", BREAK, lineno); }
| doc CASE { printf("%d %d ", CASE, lineno); }
| doc CATCH { printf("%d %d ", CATCH, lineno); }
| doc CLASS { printf("%d %d ", CLASS, lineno); }
| doc COMPL { printf("%d %d ", COMPL, lineno); }
| doc CONCEPT { printf("%d %d ", CONCEPT, lineno); }
| doc CONST { printf("%d %d ", CONST, lineno); }
| doc CONSTEXPR { printf("%d %d ", CONSTEXPR, lineno); }
| doc CONST_CAST { printf("%d %d ", CONST_CAST, lineno); }
| doc CONTINUE { printf("%d %d ", CONTINUE, lineno); }
| doc CO_AWAIT { printf("%d %d ", CO_AWAIT, lineno); }
| doc CO_RETURN { printf("%d %d ", CO_RETURN, lineno); }
| doc CO_YIELD { printf("%d %d ", CO_YIELD, lineno); }
| doc DECLTYPE { printf("%d %d ", DECLTYPE, lineno); }
| doc DEFAULT { printf("%d %d ", DEFAULT, lineno); }
| doc DELETE { printf("%d %d ", DELETE, lineno); }
| doc DO { printf("%d %d ", DO, lineno); }
| doc DYNAMIC_CAST { printf("%d %d ", DYNAMIC_CAST, lineno); }
| doc ELSE { printf("%d %d ", ELSE, lineno); }
| doc ENUM { printf("%d %d ", ENUM, lineno); }
| doc EXPLICIT { printf("%d %d ", EXPLICIT, lineno); }
| doc EXPORT { printf("%d %d ", EXPORT, lineno); }
| doc EXTERN { printf("%d %d ", EXTERN, lineno); }
| doc FALSE { printf("%d %d ", FALSE, lineno); }
| doc FOR { printf("%d %d ", FOR, lineno); }
| doc FRIEND { printf("%d %d ", FRIEND, lineno); }
| doc GOTO { printf("%d %d ", GOTO, lineno); }
| doc IF { printf("%d %d ", IF, lineno); }
| doc IMPORT { printf("%d %d ", IMPORT, lineno); }
| doc INLINE { printf("%d %d ", INLINE, lineno); }
| doc MODULE { printf("%d %d ", MODULE, lineno); }
| doc MUTABLE { printf("%d %d ", MUTABLE, lineno); }
| doc NAMESPACE { printf("%d %d ", NAMESPACE, lineno); }
| doc NEW { printf("%d %d ", NEW, lineno); }
| doc NOEXCEPT { printf("%d %d ", NOEXCEPT, lineno); }
| doc NULLPTR { printf("%d %d ", NULLPTR, lineno); }
| doc OPERATOR { printf("%d %d ", OPERATOR, lineno); }
| doc OR { printf("%d %d ", OR, lineno); }
| doc PRIVATE { printf("%d %d ", PRIVATE, lineno); }
| doc PROTECTED { printf("%d %d ", PROTECTED, lineno); }
| doc PUBLIC { printf("%d %d ", PUBLIC, lineno); }
| doc REFLEXPR { printf("%d %d ", REFLEXPR, lineno); }
| doc REGISTER { printf("%d %d ", REGISTER, lineno); }
| doc REINTERPRET_CAST { printf("%d %d ", REINTERPRET_CAST, lineno); }
| doc REQUIRES { printf("%d %d ", REQUIRES, lineno); }
| doc RETURN { printf("%d %d ", RETURN, lineno); }
| doc SIZEOF { printf("%d %d ", SIZEOF, lineno); }
| doc STATIC { printf("%d %d ", STATIC, lineno); }
| doc STATIC_ASSERT { printf("%d %d ", STATIC_ASSERT, lineno); }
| doc STATIC_CAST { printf("%d %d ", STATIC_CAST, lineno); }
| doc STRUCT { printf("%d %d ", STRUCT, lineno); }
| doc SWITCH { printf("%d %d ", SWITCH, lineno); }
| doc SYNCHRONIZED { printf("%d %d ", SYNCHRONIZED, lineno); }
| doc TEMPLATE { printf("%d %d ", TEMPLATE, lineno); }
| doc THIS { printf("%d %d ", THIS, lineno); }
| doc THREAD_LOCAL { printf("%d %d ", THREAD_LOCAL, lineno); }
| doc THROW { printf("%d %d ", THROW, lineno); }
| doc TRUE { printf("%d %d ", TRUE, lineno); }
| doc TRY { printf("%d %d ", TRY, lineno); }
| doc TYPEDEF { printf("%d %d ", TYPEDEF, lineno); }
| doc TYPEID { printf("%d %d ", TYPEID, lineno); }
| doc TYPENAME { printf("%d %d ", TYPENAME, lineno); }
| doc UNION { printf("%d %d ", UNION, lineno); }
| doc USING { printf("%d %d ", USING, lineno); }
| doc VIRTUAL { printf("%d %d ", VIRTUAL, lineno); }
| doc VOLATILE { printf("%d %d ", VOLATILE, lineno); }
| doc WHILE { printf("%d %d ", WHILE, lineno); }
| doc IDENTIFIER { printf("%d %d ", IDENTIFIER, lineno); }
| doc CONSTANT { printf("%d %d ", CONSTANT, lineno); }
| doc STRING_LITERAL { printf("%d %d ", STRING_LITERAL, lineno); }
| doc ELIF { printf("%d %d ", ELIF, lineno); }
| doc ENDIF { printf("%d %d ", ENDIF, lineno); }
| doc IFDEF { printf("%d %d ", IFDEF, lineno); }
| doc IFNDEF { printf("%d %d ", IFNDEF, lineno); }
| doc DEFINE { printf("%d %d ", DEFINE, lineno); }
| doc UNDEF { printf("%d %d ", UNDEF, lineno); }
| doc INCLUDE { printf("%d %d ", INCLUDE, lineno); }
| doc LINE { printf("%d %d ", LINE, lineno); }
| doc ERROR { printf("%d %d ", ERROR, lineno); }
| doc PRAGMA { printf("%d %d ", PRAGMA, lineno); }
| doc DEFINED { printf("%d %d ", DEFINED, lineno); }
| doc ELLIPSIS { printf("%d %d ", ELLIPSIS, lineno); }
| doc MEMBER_ACCESS { printf("%d %d ", MEMBER_ACCESS, lineno); }
| doc MEMBER_ACCESS_POINTER { printf("%d %d ", MEMBER_ACCESS_POINTER, lineno); }
| doc SCOPE_RESOLUTION { printf("%d %d ", SCOPE_RESOLUTION, lineno); }
| doc NOT_EQ { printf("%d %d ", NOT_EQ, lineno); }
| doc NOT { printf("%d %d ", NOT, lineno); }
| doc BITNOT { printf("%d %d ", BITNOT, lineno); }
| doc LOGIC_OR { printf("%d %d ", LOGIC_OR, lineno); }
| doc OR_EQ { printf("%d %d ", OR_EQ, lineno); }
| doc BITOR { printf("%d %d ", BITOR, lineno); }
| doc LOGIC_AND { printf("%d %d ", LOGIC_AND, lineno); }
| doc AND_EQ { printf("%d %d ", AND_EQ, lineno); }
| doc BITAND { printf("%d %d ", BITAND, lineno); }
| doc XOR_EQ { printf("%d %d ", XOR_EQ, lineno); }
| doc XOR { printf("%d %d ", XOR, lineno); }
| doc MULTIPLY_EQ { printf("%d %d ", MULTIPLY_EQ, lineno); }
| doc MULTIPLY { printf("%d %d ", MULTIPLY, lineno); }
| doc INCREMENT { printf("%d %d ", INCREMENT, lineno); }
| doc ADD_EQ { printf("%d %d ", ADD_EQ, lineno); }
| doc ADD { printf("%d %d ", ADD, lineno); }
| doc DECREMENT { printf("%d %d ", DECREMENT, lineno); }
| doc SUBTRACT_EQ { printf("%d %d ", SUBTRACT_EQ, lineno); }
| doc SUBTRACT { printf("%d %d ", SUBTRACT, lineno); }
| doc DIVIDE_EQ { printf("%d %d ", DIVIDE_EQ, lineno); }
| doc DIVIDE { printf("%d %d ", DIVIDE, lineno); }
| doc MOD_EQ { printf("%d %d ", MOD_EQ, lineno); }
| doc MOD { printf("%d %d ", MOD, lineno); }
| doc RELATIONAL_ASSIGNMENT { printf("%d %d ", RELATIONAL_ASSIGNMENT, lineno); }
| doc ASSIGNMENT { printf("%d %d ", ASSIGNMENT, lineno); }
| doc LEFT_SHIFT_EQ { printf("%d %d ", LEFT_SHIFT_EQ, lineno); }
| doc LEFT_SHIFT { printf("%d %d ", LEFT_SHIFT, lineno); }
| doc LESS_EQ { printf("%d %d ", LESS_EQ, lineno); }
| doc LESS { printf("%d %d ", LESS, lineno); }
| doc RIGHT_SHIGT_EQ { printf("%d %d ", RIGHT_SHIGT_EQ, lineno); }
| doc RIGHT_SHIFT { printf("%d %d ", RIGHT_SHIFT, lineno); }
| doc GREATER_EQ { printf("%d %d ", GREATER_EQ, lineno); }
| doc GREATER { printf("%d %d ", GREATER, lineno); }
| doc DOUBLE_QUOTATION { printf("%d %d ", DOUBLE_QUOTATION, lineno); }
| doc HASH { printf("%d %d ", HASH, lineno); }
| doc DOLLAR { printf("%d %d ", DOLLAR, lineno); }
| doc APOSTROPHE { printf("%d %d ", APOSTROPHE, lineno); }
| doc FIRST_BRACKET_START { printf("%d %d ", FIRST_BRACKET_START, lineno); }
| doc FIRST_BRACKET_END { printf("%d %d ", FIRST_BRACKET_END, lineno); }
| doc COMMA { printf("%d %d ", COMMA, lineno); }
| doc COLON { printf("%d %d ", COLON, lineno); }
| doc SEMICOLON { printf("%d %d ", SEMICOLON, lineno); }
| doc QUESTION { printf("%d %d ", QUESTION, lineno); }
| doc AT { printf("%d %d ", AT, lineno); }
| doc SQUARE_BRACKET_START { printf("%d %d ", SQUARE_BRACKET_START, lineno); }
| doc SQUARE_BRACKET_END { printf("%d %d ", SQUARE_BRACKET_END, lineno); }
| doc BACKSLASH { printf("%d %d ", BACKSLASH, lineno); }
| doc UNDERSCORE { printf("%d %d ", UNDERSCORE, lineno); }
| doc GRAVE { printf("%d %d ", GRAVE, lineno); }
| doc BRACES_START { printf("%d %d ", BRACES_START, lineno); }
| doc BRACES_END { printf("%d %d ", BRACES_END, lineno); }
| doc OTHER { printf("%d %d ", OTHER, lineno); }
| 
;
%%

int main()
{
	//freopen("17.c", "r", stdin);
	//freopen("out", "w", stdout);
	yyparse();
	//printf("line no : %d\n", lineno);
	return 0;
}

void yyerror(const char* buf)
{
	printf("%s\n", buf);
	exit(1);
}
