Username: admin + Pass: admin
Create a Project with a Token 



sudo docker run --rm -e SONAR_HOST_URL="http://100.24.255.50/" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=dustbin2_sonar-scanner_AYsvDRh708vF4BCgxRuY" -e SONAR_TOKEN="sqp_63b450b617085ca783ccc206910941e3453cb3b3" -v .:/usr/src sonarsource/sonar-scanner-cli


### CICD ##########################################################
stages:
 - build
 - sonarqube

build:
 stage: build
 tags: 
 - tag1
 script:
 - echo "Building your code here..."
 - ls -la
 - pwd
 - hostname
 - cat /etc/os-release
 - docker ps 
 - docker ps -a

sonarqube_scan:
 stage: sonarqube
 tags: 
 - tag1
 script:
 - >
 sudo docker run --rm -e SONAR_HOST_URL="http://100.24.255.50/" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=dustbin2_sonar-scanner_AYsvDRh708vF4BCgxRuY" -e SONAR_TOKEN="sqp_63b450b617085ca783ccc206910941e3453cb3b3" -v .:/usr/src sonarsource/sonar-scanner-cli
 
 only:
 - main