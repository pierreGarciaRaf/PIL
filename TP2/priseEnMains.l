%{
  // Lit et affiche les sous-titres (sans prendre en compte les sauts
  // de lignes) avec leurs temps de dÃ©but et de fin dans un
  // fichier .sub
  int t1 = 0;
  int t2 = 0;
%}
/** Indication: le contenu d'un sous-titre est une chaine de caractÃ¨res
 * qui ne commence pas par "{" et qui ne contient pas de retour Ã  la
 * ligne.
 **/


START    "{"[0-9]*
END      "}{"[0-9]*

FSTLINE "}"[^"{"][^"|""\n"]*
LINE "|"[^"|""\n"]*

%%
{START} {
  /* atoi - change le type de la chaine de caractère en un entier. */
  /* yytext+1 désigne la chaine reconnue sans le premier character. */
  t1 = atoi(yytext+1);
  printf("Du temps %d ", t1);
}
{END} {
    t2 = atoi(yytext+2);
    printf("au temps %d ",t2);
}
{FSTLINE} {
  printf("le sous-titre:\n    %s \n", yytext+1);
}
{LINE} {
    printf("    %s \n",yytext + 1);
}
\n {}
%%
int main() {
  yylex();
  return 0;
}
