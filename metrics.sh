#!/bin/sh

# Simple code metrics extractor for C# (and similar languages)
# usage: metrics.sh PATTERN
# example: metrics.sh *.cs

echo -n 'Total Lines: '
find . -iname $1 | xargs cat | wc -l
echo -n 'Non-Blanks:  '
find . -iname $1 | xargs grep -ve '^\s*$' | wc -l
echo -n '// Comments: '
find . -iname $1 | xargs grep -e '//' | wc -l
echo -n '/* Comments: '
find . -iname $1 | xargs grep -e '/\*' | wc -l
echo -n 'Semicolons:  '
find . -iname $1 | xargs grep ';' | wc -l
echo -n 'Classes:     '
find . -iname $1 | xargs grep 'class' | wc -l
echo -n 'Interfaces:  '
find . -iname $1 | xargs grep 'interface' | wc -l
echo -n 'Namespaces:  '
find . -iname $1 | xargs grep -h 'namespace' | sort | uniq | wc -l
echo -n 'Files:       '
find . -iname $1 | wc -l
