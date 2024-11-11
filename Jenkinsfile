pipeline {
    agent any

    stages {
        stage("checkout") {
            steps {
                script {
                    sh "echo checkcout"
                }
            }
        }

        stage("Compile") {
            steps {
                sh "./gradlew compileJava"
            }
        }
    }
}
