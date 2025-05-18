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
                pwd
                chmod +x /var/jenkins_home/workspace/Pipe_please/scripts/test.sh
                ./var/jenkins_home/workspace/Pipe_please/scripts/test.sh
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