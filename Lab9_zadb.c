#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>

int main() {
    FILE *shadowFile = fopen("/etc/shadow", "r"); 
    if (shadowFile == NULL) {
        perror("Nie można otworzyć pliku /etc/shadow. Brak uprawnień."); 
        return 1;
    }

    char line [1024];

    while (fgets(line, sizeof(line), shadowFile) != NULL) {
        printf("%s", line);
    }

    fclose(shadowFile);
    
    return 0;
}