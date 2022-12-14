#!/usr/bin/env bash

REPOSITORY=/opt/dev-sesame
cd $REPOSITORY

APP_NAME=action_codedeploy
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep '.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 종료할것 없음."
else
  echo "> kill -9 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

chmod +x $JAR_PATH

echo "> $JAR_PATH 배포"
nohup java -jar -Dspring.profiles.active=dev $JAR_PATH > /home/ec2-user/nohub.out 2>&1 &
