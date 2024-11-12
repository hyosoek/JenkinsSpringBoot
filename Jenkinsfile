pipeline {
    agent any
    environment{
       DOCKERHUB_CREDENTIALS = credentials("docker-hub")
    }
    stages {
        stage("Permission") {
            steps {
                sh "chmod +x ./gradlew"
            }
        }

        stage("Compile") {
            steps {
                sh "./gradlew compileJava"
            }
        }

        stage("Unit Test") {
            steps {
                sh "./gradlew test"
            }
        }

        stage("Code Coverage") {
            steps {
                sh "./gradlew jacocoTestCoverageVerification"
                sh "./gradlew jacocoTestReport"

                publishHTML(target: [
                    reportDir: 'build/reports/jacoco/test/html',
                    reportFiles: 'index.html',
                    reportName: 'Jacoco Report'
                ])
            }
        }

        stage("Static Code Analysis") {
            steps {
                sh "./gradlew checkstyleMain"
                publishHTML(target: [
                    reportDir: 'build/reports/checkstyle/',
                    reportFiles: 'main.html',
                    reportName: 'Checkstyle Report'
                ])
            }
        }

        stage("Gradle Build") {
            steps {
                sh "./gradlew clean build"
            }
        }

        stage("List Files in build/libs/") { // 파일 목록 출력 스테이지 추가
            steps {
                sh "ls -l build/libs/"
            }
        }

        stage("Docker Image Build") {
            steps {
                sh "docker ps"
            }
        }

        stage("Docker Image Build - Actual Build") {
            steps {
                sh "docker build -t tennfin1/jenkins1111  ."
            }
        }

//         stage("Set Variables") {
//             steps {
//                 echo "Set Variables"
//                 script {
//                     DOCKER_HUB_URL = 'registry.hub.docker.com'
//                     DOCKER_HUB_FULL_URL = 'https://' + DOCKER_HUB_URL
//                     DOCKER_HUB_CREDENTIAL_ID = 'docker-hub'
//                 }
//             }
//         }

        stage('docker hub login'){
          steps{
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          }
        }

        stage('docker hub push'){
          steps{
              sh 'docker push tennfin1/jenkins1111:latest'
          }
        }

        stage('deploy'){
           steps{
               sh "docker run -d --rm -p 8082:8080 --name jenkins1111 tennfin1/jenkins1111"
           }
        }

        stage('acceptance test'){
          steps{
              sleep 60
              sh 'chmod +x acceptance_test.sh && ./acceptance_test.sh'
          }
        }


    }
}
