#include <stdio.h>
#include <stdlib.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    // -------------------------------
    // Test string functions
    // -------------------------------
    char str1[100] = "Hello";
    char str2[100] = " World";
    char copy[100];

    printf("Testing mystrfunctions:\n");

    // mystrlen
    printf("Length of '%s' = %d\n", str1, mystrlen(str1));

    // mystrcpy
    mystrcpy(copy, str1);
    printf("Copied string: %s\n", copy);

    // mystrncpy
    mystrncpy(copy, str2, 3);
    copy[3] = '\0'; // ensure null termination
    printf("First 3 chars copied from str2: %s\n", copy);

    // mystrcat
    mystrcpy(copy, str1);  // copy "Hello"
    mystrcat(copy, str2);  // concatenate " World"
    printf("Concatenated string: %s\n\n", copy);

    // -------------------------------
    // Test file functions
    // -------------------------------
    FILE* fp = fopen("sample.txt", "r");
    if (!fp) {
        perror("Error opening sample.txt");
        return 1;
    }

    printf("Testing myfilefunctions:\n");

    // wordCount
    int lines, words, chars;
    if (wordCount(fp, &lines, &words, &chars) == 0) {
        printf("Lines: %d, Words: %d, Characters: %d\n", lines, words, chars);
    }
    rewind(fp); // reset pointer for mygrep

    // mygrep
    char** matches;
    int count = mygrep(fp, "hello", &matches);
    if (count >= 0) {
        printf("Found %d matches for 'hello':\n", count);
        for (int i = 0; i < count; i++) {
            printf("%s", matches[i]);
            free(matches[i]); // free each line
        }
        free(matches); // free array
    } else {
        printf("mygrep failed.\n");
    }

    fclose(fp);

    return 0;
}
