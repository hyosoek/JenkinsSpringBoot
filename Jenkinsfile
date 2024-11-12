pipeline {
    agent any
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
        } // 코드 커버리지 스테이지의 중괄호 닫기

        stage("Gradle Build") {
            steps {
                sh "./gradlew clean build"
            }
        }

        stage("Docker Image Build") { // 첫 번째 Docker 이미지 빌드
            steps {
                sh "docker ps"
            }
        }

        stage("Docker Image Build - Actual Build") { // 두 번째 스테이지 이름 변경
            steps {
                sh "docker build -t jenkins1111 ."
            }
        }

        stage("Set Variables"){
           steps{
               echo "SetVariables"

               script{
                   DOCKER_HUB_URL = 'registry.hub.docker.com'
                   DOCKER_HUB_FULL_URL = 'https://' + DOCKER_HUB_URL
                   DOCKER_HUB_CREDENTIAL_ID = 'docker-hub'
               }
           }
        }


    } // stages의 중괄호 닫기
} // pipeline의 중괄호 닫기
