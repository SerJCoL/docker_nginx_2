pipeline {
    agent {
        docker { image 'nginx:latest' }
    }
    environment {
        CI = 'true' 
        HOME = '.'
    }
    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm ci'
            }
        }
        stage('Test') { 
            steps {
                sh './scripts/test' 
            }
        }
        stage('Build Container') { 
            steps {
                sh 'docker build -t test-app:${BUILD_NUMBER} . ' 
            }
        }
    }
}
