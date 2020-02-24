%{
    #define bool unsigned int
    #define true 1
    #define false 0
    unsigned int lines = 0;
    unsigned int words = 0;
    unsigned int characters = 0;
    bool wasReadingAword = false;
%}
notSeparator [^" ""\n"]
%%
" " {
    
    if (wasReadingAword){
        wasReadingAword = false;
        words +=1;
    }
    characters += 1;
}
"\n" {
    if (wasReadingAword){
        wasReadingAword = false;
        words += 1;
    }
    characters +=1;
    lines += 1;
}
. {
    wasReadingAword = true;
    characters += 1;
}
%%
int main(){
    yylex();
    if (wasReadingAword){
        words+=1;
    }
    printf("lines : %d, words : %d, characters : %d.\n",lines,words,characters);
}