#!/bin/bash

FILE="pyproject.toml"
# FILE="../../pyproject.toml"

while read LINE
    do 
    i=`expr index "$LINE" =`
    LINE="${LINE:0:$i-1}${LINE:$i}"
    IFS=' ' read -ra WORDS <<< "$LINE"
    # for i in "${WORDS[@]}"; do echo $i; done
    if [ "${WORDS[0]}" == "version" ] 
    then
        VERSION="${WORDS[1]}"
        echo "v${VERSION:1: -2}"
        git tag -a "v${VERSION:1: -2}" -m "Automatic release"
        git push --follow-tags
        break
    fi
done < $FILE


# FILE="koinput/__init__.py"
# j=0
# while read LINE
#     do 
#     j=$((j+1))
#     i=`expr index "$LINE" =`
#     LINE="${LINE:0:$i-1}${LINE:$i}"
#     IFS=' ' read -ra WORDS <<< "$LINE"
#     # for i in "${WORDS[@]}"; do echo $i; done
#     if [ "${WORDS[0]}" == "__version__" ] 
#     then
#         break
#     fi
# done < $FILE

# FILE1=".github/workflows/__init__.py"
# i=0
# for LINE in 
#     do 
#     i=$((i+1))
#     if [ $i = $j ]
#     then
#         echo "__version__ = $VERSION"
#         #echo "__version__ = $VERSION" >> $FILE1
#     else
#         echo $LINE 
#         #echo $LINE >> $FILE1
#     fi
# done 

# mv $FILE1 $FILE