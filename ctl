#!/bin/bash
#anthor jamlee webboy89860@gmail.com

ip=192.168.99.11/24
brip=192.168.99.254/24
con_name=web




#begin
name=`docker-compose ps| grep $con_name | awk '{print $1}'`
if [ "$1" == "restart" ]; then
  #init enviroment
  sudo docker-compose stop &&sudo  docker-compose rm -f &&sudo  docker-compose up -d

  #assign ip to container
  brName="brJamlee";
  sudo pipework $brName $name $ip
  sudo ip addr add $brip dev $brName
fi

if [ "$1" == "stop" ]; then
  sudo docker-compose stop &&sudo  docker-compose rm -f 
fi


if [ "$1" == "start" ]; then
  #init enviroment
  sudo  docker-compose up -d
  #assign ip to container
  brName="brJamlee";
  sudo pipework $brName $name $ip
  sudo ip addr add $brip dev $brName
fi

if [ "$1" == "rm" ]; then
  #init enviroment
  sudo docker-compose stop && sudo  docker-compose rm -f
fi

if [ "$1" == "enter" ]; then
  sudo docker exec -ti $name /bin/bash
fi
#end