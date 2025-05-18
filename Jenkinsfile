pipeline {
    agent {
        docker {
            image 'saruz/my-node-app:latest'
            args '-v $WORKSPACE:/app -w /app'  // Монтируем и устанавливаем рабочую директорию
        }
    }
    stages {
        stage('Install Dependencies'){
            steps{
            sh 'npm install'
            }
        }        
        stage('Test') {
            steps {
                sh '''
                chmod +x /test.sh
                /bin/bash /test.sh
                '''
            }
        }
        stage('Run app') {
            steps {
                sh 'npm start'
            }
        }

    }
}