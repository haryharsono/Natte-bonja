#!/bin/bash

pwd=$(pwd)

data=$pwd/src/main/resources/nattebonja.txt 

check=$pwd/src/main/resources
applicationProperties=$check/application-local.properties

  echo "Pwd -> "$data
if [[ -f $data ]]; then
  echo "File Already"
fi
  cp  /Users/haryharsono/projects/nattebonja/nattebonja.txt $check 


if [[ -f $applicationProperties ]]; then
  rm /Users/haryharsono/projects/nattebonja/application.properties 
  cp  $check/application.properties /Users/haryharsono/projects/nattebonja/application.properties 
fi
if grep -Fxq "spring.banner.location=classpath:nattebonja.txt" $check/application.properties
then
     echo "File Already"
 else
     echo -e "\n spring.banner.location=classpath:nattebonja.txt" >> $check/application.properties
fi
# cat $check/application.properties 
 
# Run Maven
 mvn clean package spring-boot:run -Dmaven.test.skip
