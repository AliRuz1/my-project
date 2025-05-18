pipeline {
    agent {
        docker {
            image 'saruz/my-node-app:latest'
        }
    }
    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test'){
            steps{
                sh './scripts/test.sh'
            }
        }
        stage('Run app') {
            steps {
                sh 'npm start'
            }
        }
    }
}
