pipeline {
    agent any

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Repo') {
            steps {
                sh 'git clone https://github.com/dahalutsab/git-practice.git'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t go-app git-practice'
            }
        }

        stage('stop container') {
            steps {
                sh 'docker stop go-app-container'
            }
        }
        
        stage('Delete container') {
            steps {
                sh 'docker rm go-app-container'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name go-app-container -p 8081:8080 go-app'
            }
        }
    }
}
