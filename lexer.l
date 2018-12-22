%option noyywrap
%{
#include<bits/stdc++.h>
using namespace std;
#include "parser.tab.h"
%}
D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*
%%

[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {}
"//".* {}

[ \t]+ {}
\n {return NEWLINE;}

"long double" {return LONG_DOUBLE ;}

"signed "?char {return CHAR ;}
"signed	"?short" int"? {return SHORT_INT ;}
"signed "?"long long"" int"? {return LONG_LONG_INT ;}
"signed "?long" int"? {return LONG_INT ;}
signed" int"? {return INT;}

"unsigned char" {return UNSIGNED_CHAR ;}
"unsigned short"" int"? {return UNSIGNED_SHORT_INT ;}
"unsigned long long"" int"? {return UNSIGNED_LONG_LONG_INT ;}
"unsigned long"" int"? {return UNSIGNED_LONG_INT ;}
unsigned" int"? {return UNSIGNED_INT ;}

bool {return BOOL ;}
int {return INT ;}
double {return DOUBLE ;}
float {return FLOAT ;}
void {return VOID ;}
char16_t {return CHAR16_T ;}
char32_t {return CHAR32_T ;}
wchar_t {return WCHAR_T ;}

alignas {return ALIGNAS ;}
alignof {return ALIGNOF ;}
and {return AND ;}
and_eq {return AND_EQ ;}
asm {return ASM ;}
atomic_cancel {return ATOMIC_CANCEL ;}
atomic_commit {return ATOMIC_COMMIT ;}
atomic_noexcept {return ATOMIC_NOEXCEPT ;}
auto {return AUTO ;}
bitand {return BITAND ;}
bitor {return BITOR ;}
break {return BREAK ;}
case {return CASE ;}
catch {return CATCH ;}
class {return CLASS ;}
compl {return COMPL ;}
concept {return CONCEPT ;}
const {return CONST ;}
constexpr {return CONSTEXPR ;}
const_cast {return CONST_CAST ;}
continue {return CONTINUE ;}
co_await {return CO_AWAIT ;}
co_return {return CO_RETURN ;}
co_yield {return CO_YIELD ;}
decltype {return DECLTYPE ;}
default {return DEFAULT ;}
delete {return DELETE ;}
do {return DO ;}
dynamic_cast {return DYNAMIC_CAST ;}
else {return ELSE ;}
enum {return ENUM ;}
explicit {return EXPLICIT ;}
export {return EXPORT ;}
extern {return EXTERN ;}
false {return FALSE ;}
for {return FOR ;}
friend {return FRIEND ;}
goto {return GOTO ;}
if {return IF ;}
import {return IMPORT ;}
inline {return INLINE ;}
module {return MODULE ;}
mutable {return MUTABLE ;}
namespace {return NAMESPACE ;}
new {return NEW ;}
noexcept {return NOEXCEPT ;}
not {return NOT ;}
not_eq {return NOT_EQ ;}
nullptr {return NULLPTR ;}
operator {return OPERATOR ;}
or {return OR ;}
or_eq {return OR_EQ ;}
private {return PRIVATE ;}
protected {return PROTECTED ;}
public {return PUBLIC ;}
reflexpr {return REFLEXPR ;}
register {return REGISTER ;}
reinterpret_cast {return REINTERPRET_CAST ;}
requires {return REQUIRES ;}
return {return RETURN ;}
sizeof {return SIZEOF ;}
static {return STATIC ;}
static_assert {return STATIC_ASSERT ;}
static_cast {return STATIC_CAST ;}
struct {return STRUCT ;}
switch {return SWITCH ;}
synchronized {return SYNCHRONIZED ;}
template {return TEMPLATE ;}
this {return THIS ;}
thread_local {return THREAD_LOCAL ;}
throw {return THROW ;}
true {return TRUE ;}
try {return TRY ;}
typedef {return TYPEDEF ;}
typeid {return TYPEID ;}
typename {return TYPENAME ;}
union {return UNION ;}
using {return USING ;}
virtual {return VIRTUAL ;}
volatile {return VOLATILE ;}
while {return WHILE ;}
xor {return XOR ;}
xor_eq {return XOR_EQ ;}

elif {return ELIF ;}
endif {return ENDIF ;}
ifdef {return IFDEF ;}
ifndef {return IFNDEF ;}
define {return DEFINE ;}
undef {return UNDEF ;}
include {return INCLUDE ;}
line {return LINE ;}
error {return ERROR ;}
pragma {return PRAGMA ;}
defined {return DEFINED ;}

[a-zA-Z_][a-zA-Z0-9_]* {return IDENTIFIER ;}


0[xX]{H}+{IS}? {return CONSTANT ;}
0{D}+{IS}? {return CONSTANT ;}
{D}+{IS}? {return CONSTANT ;}
L?'(\\.|[^\\'])+' {return CONSTANT ;}
{D}+{E}{FS}? {return CONSTANT ;}
{D}*"."{D}+({E})?{FS}? {return CONSTANT ;}
{D}+"."{D}*({E})?{FS}? {return CONSTANT ;}

L?\"(\\.|[^\\"])*\" {return STRING_LITERAL ;}

"..." {return ELLIPSIS ;}
"." {return MEMBER_ACCESS ;}
"->" {return MEMBER_ACCESS_POINTER ;}

"::" {return SCOPE_RESOLUTION ;}

"!=" {return NOT_EQ ;}
"!" {return NOT ;}
"~" {return BITNOT ;}
"||" {return LOGIC_OR ;}
"|=" {return OR_EQ ;}
"|" {return BITOR ;}
"&&" {return LOGIC_AND ;}
"&=" {return AND_EQ ;}
"&" {return BITAND ;}
"^=" {return XOR_EQ ;}
"^" {return XOR ;}

"*=" {return MULTIPLY_EQ ;}
"*" {return MULTIPLY ;}
"++" {return INCREMENT ;}
"+=" {return ADD_EQ ;}
"+" {return ADD ;}
"--" {return DECREMENT ;}
"-=" {return SUBTRACT_EQ ;}
"-" {return SUBTRACT ;}
"/=" {return DIVIDE_EQ ;}
"/" {return DIVIDE ;}
"%=" {return MOD_EQ ;}
"%" {return MOD ;}

"==" {return RELATIONAL_ASSIGNMENT ;}
"=" {return ASSIGNMENT ;}

"<<=" {return LEFT_SHIFT_EQ ;}
"<<" {return LEFT_SHIFT ;}
"<=" {return LESS_EQ ;}
"<" {return LESS ;}
">>=" {return RIGHT_SHIGT_EQ ;}
">>" {return RIGHT_SHIFT ;}
">=" {return GREATER_EQ ;}
">" {return GREATER ;}

\" {return DOUBLE_QUOTATION ;}
# {return HASH ;}
"$" {return DOLLAR ;}
"'" {return APOSTROPHE ;}
"(" {return FIRST_BRACKET_START ;}
")" {return FIRST_BRACKET_END ;}
"," {return COMMA ;}
":" {return COLON ;}
";" {return SEMICOLON ;}
"?" {return QUESTION ;}
"@" {return AT ;}
"[" {return SQUARE_BRACKET_START ;}
"]" {return SQUARE_BRACKET_END ;}
"\\" {return BACKSLASH ;}
"_" {return UNDERSCORE ;}
"`" {return GRAVE ;}
"{" {return BRACES_START ;}
"}" {return BRACES_END ;}

. {return OTHER ;}

%%

