#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../include/myfilefunctions.h"

// Count the number of lines, words and characters in the passed file stream
int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (!file || !lines || !words || !chars) {
        return -1; // failure
    }

    *lines = *words = *chars = 0;
    char ch;
    int inWord = 0;

    while ((ch = fgetc(file)) != EOF) {
        (*chars)++;

        if (ch == '\n') {
            (*lines)++;
        }

        if (ch == ' ' || ch == '\t' || ch == '\n') {
            inWord = 0;
        } else if (inWord == 0) {
            inWord = 1;
            (*words)++;
        }
    }

    return 0; // success
}

// Search for lines containing search_str in a file
int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (!fp || !search_str || !matches) {
        return -1;
    }

    char buffer[1024];
    int count = 0;
    int capacity = 10;
    *matches = malloc(capacity * sizeof(char*));
    if (!*matches) return -1;

    while (fgets(buffer, sizeof(buffer), fp)) {
        if (strstr(buffer, search_str)) {
            if (count >= capacity) {
                capacity *= 2;
                char** temp = realloc(*matches, capacity * sizeof(char*));
                if (!temp) return -1;
                *matches = temp;
            }
            (*matches)[count] = strdup(buffer); // copy matching line
            count++;
        }
    }

    return count; // return number of matches
}
