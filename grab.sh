#!/bin/bash

grab_projects(){
    seq $1 $2 >/dev/null 2>&1
    if [ $? -ne 0 ]
    then
      echo -e "\033[31m [ERROR]\033[0m Invaild args"
      exit 1
    fi
    echo -e "\033[34m [INFO]\033[0m Ranged from $1 to $2"
    for num in `seq $1 $2`
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
        for i in *.mlp # 空格问题
        do
          a=`echo ${i} | sed -s "s/.mlp//g"`
          mv "${i}" "${a}.json"
        done
        echo -e "\033[32m ------>\033[0m Formatting: $num"
        prettier -w ./ # npm install --global prettier
        cd ..
        rm $num.zip
      fi
    done
}

check_dependencies(){
    jar --version > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
      echo -e "\033[31m [ERROR]\033[0m Jar is not installed"
      exit 1
    fi
    prettier --version > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
      echo -e "\033[31m [ERROR]\033[0m Prettier is not installed, please run 'npm install --global prettier'"
      exit 1
    fi
}

help(){
    cat <<- EOF
    自动抓取通过“备份到云端”功能泄露到公网的玩酷电音工程，整理为 JSON 并利用 prettier 格式化
    
    Usage: ./grab.sh ([START_ID]) [END_ID]
    
        If neither START_ID or END_ID is set, the script will scan 1-300000 by default.
        若 START_ID 与 END_ID 均未设置，脚本默认遍历1-300000
        
        JRE and Prettier are required.
        需安装JRE与Prettier
    
    Legal Notice:
    - 《玩酷电音》(CoolBeat)软件著作权由海宁微视软件有限公司所有
    - 各工程著作权由其作者所有，未经原作者允许禁止使用、汇编、修改、公开发布
    - **本存储库仅供学习交流**，请于下载、克隆（clone）、复刻（fork）等操作后后的 24 小时内从您的计算机、手机、GitHub 账户中完全删除相关内容
    - 如本存储库侵犯了您的权益，请：
      - 联系 wangpy01@outlook.com
      - 向 GitHub 提交 DMCA 删除请求

EOF
    exit 0
}

if [ $# -eq 0 ]
then
  check_dependencies
  grab_projects 1 300000
elif [ $# -eq 1 ]
then
  case $1 in
        -h) help; exit 0;;
        --) shift;break;;
        -*) echo "\033[31m [ERROR]\033[0m No such option $1."; exit 1;;
        *) break;;
  esac
  grab_projects 1 $1
elif [ $# -eq 2 ]
then
  check_dependencies
  grab_projects $1 $2
else
  echo -e "\033[31m [ERROR]\033[0m Invaild args"
  exit 1
fi