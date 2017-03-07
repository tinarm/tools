#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Wrong number of args. Should be one (1)."
    echo
    echo "Usage: $0 <project name>"
    exit 1
fi

project="$1"
cfile="$project"/main.c
hfile="$project"/main.h
mfile="$project"/Makefile

if [ -e "$project" ]; then
    echo Will not overwrite existing files!
    exit 1
fi

mkdir "$project"

# Creating main source file.
echo '#include <stdio.h>' >> "$cfile"
echo >> "$cfile"
echo 'int main(void)' >> "$cfile"
echo '{' >> "$cfile"
echo '    printf("Hello, World!\n");' >> "$cfile"
echo '    return 0;' >> "$cfile"
echo '}' >> "$cfile"
echo >> "$cfile"

# Creating main header file.
echo '#ifndef MAIN_HEADER_H' >> "$hfile"
echo '#define MAIN_HEADER_H' >> "$hfile"
echo >> "$hfile"
echo '/* Content of header file */' >> "$hfile"
echo >> "$hfile"
echo '#endif' >> "$hfile"
echo >> "$hfile"

# Creating Makefile.
echo 'src = $(wildcard *.c)' >> "$mfile"
echo 'obj = $(src:.c=.o)' >> "$mfile"
echo >> "$mfile"
echo 'LDFLAGS = #-lz -lm' >> "$mfile"
echo >> "$mfile"
echo "${project}: \$(obj)" >> "$mfile"
echo -n -e '\t' >> "$mfile"
echo '$(CC) -Wall -o $@ $^ $(LDFLAGS)' >> "$mfile"
echo >> "$mfile"
echo '.PHONY: clean' >> "$mfile"
echo 'clean:' >> "$mfile"
echo -n -e '\t' >> "$mfile"
echo 'rm -f $(obj) myprog' >> "$mfile"
echo >> "$mfile"

