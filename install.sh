#!/bin/bash

chmod +x enpl plen

echo $PATH | sed 's/:/\n/g' | grep $USER | while read x; do
    owner=$(stat -c %U $x)
    if [ "$owner" = "$USER" ]; then
        ln -s $(pwd)/enpl $x/enpl && \
        ln -s $(pwd)/plen $x/plen && \
        exit 0
    fi
done
