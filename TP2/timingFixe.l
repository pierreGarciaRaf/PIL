%{
  // Afficher les sous-titres d'un fichier ".sub" pendant 2 secondes
  // sÃ©parÃ©es d'une seconde de blanc.
    int t1 = 0;
    int t2 = 0;
    int lastT = 0;
%}

START    "{"[0-9]*
END      "}{"[0-9]*

FSTLINE "}"[^"{"][^"|""\n"]*
LINE ("|"[^"|""\n"]*)|"\n"

%%

{START} {
  t1 = atoi(yytext+1);
}

{END} {
    t2 = atoi(yytext+2);
}
{FSTLINE} {
  /* usleep - Interrompre le programme durant un nombre donnÃ© de microsecondes. */
  /* ATTENTION dans les fichier .sub il faut considÃ©rer qu'il y a 25 images par seconde. */
  /* system("clear") - Efface le contenu de la console. */
  system("clear");
  usleep((t1 - lastT)*1000000/25);
  printf("   %s\n", yytext+1);
}
{LINE}/{LINE} {  
    printf("%s\n", yytext+1);
}

{LINE} {
    printf("%s\n", yytext+1);
    usleep((t2 - t1)*1000000/25);
    lastT = t2;
}

(.|\n) {}

%%