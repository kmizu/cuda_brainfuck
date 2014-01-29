#!/bin/bash

echo "processor $processor start."
dir=${processor}_speed
mkdir $dir

bf=tester.bf
cp 1000000.bf $bf
vim -c 'normal ggyy15p' -c 'wq' $bf

for i in `seq 1 3`
do
    thread=`expr 16 \* $i`
    file="${dir}/${thread}thread.log"
    touch $file
    echo "processing ${file}..."
    for j in `seq 1 10`
    do
        if test "$processor" = "cpu"
        then
            ./gpubf -ctl $bf >> $file
        else
            ./gpubf -tl $bf >> $file
        fi
    done
    cat $file
    vim -c 'normal ggyy16p' -c 'wq' $bf
done

rm $bf
echo "processor $processor end."