%%

5   {
        printf("5");
    }

[0-9]+ {
        printf("Un entier %s \n",yytext);
    }

[0-9]+"."[0-9]* {
        printf("Un reel %s \n",yytext);
    }
.
    {
        printf("unread.");
    }

%%