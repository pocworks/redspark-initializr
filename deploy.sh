#!/bin/bash
docker build -t redspark/redspark-initializr:$BUILD_TAG redspark-initializr-service
docker login -e $DOCKER_HUB_EMAIL -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD
docker push redspark/redspark-initializr:$BUILD_TAG

for i in {1..2};
  do
    output=$(curl -s -X POST "http://hook.redspark.io/hook/execute?token=teste&hook=redspark-initializr&param=$BUILD_TAG")
    resultado=$(echo $output | grep -c '"success": true');
    if [ $resultado == 0 ]; then
      echo "Ocorreu um erro na tentativa numero: $i/2";
      echo "Executando novamente...";
      echo $output
     else
      echo $output
      echo "Versão atualizada com sucesso...";
      break;
     fi;
  done
