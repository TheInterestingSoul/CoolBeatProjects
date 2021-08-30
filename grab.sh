#!/bin/bash

for num in `seq 1 300000`
do 
  curl -f -s \
    "http://49.234.152.71:8080/cbprj/$num" \
    -o $num.zip; 
  if [ $? -eq 0 ]
  then 
    echo -e "\033[32m [FOUND]\033[0m Found prpject: $num"
    mkdir $num
    cd $num
    echo -e "\033[32m ------>\033[0m Extracting: $num"
    jar xvf ../$num.zip # 乱码问题
    for i in *.mlp
    do
      a=`basename $i .mlp`
      mv $i $a.json
    done
    echo -e "\033[32m ------>\033[0m Formatting: $num"
    prettier -w ./ # npm install --global prettier
    cd ..
    rm $num.zip
  fi
done
