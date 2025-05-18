pipeline {
    agent {
        docker {
            image 'saruz/my-node-app:latest'
            args '-v $WORKSPACE:/app -w /app'  // Монтируем и устанавливаем рабочую директорию
        }
    }
    stages {
        stage('Install Dependencies'){
            sh 'npm install'
        }
stage('Test') {
    steps {
        sh '''
            /bin/bash scripts/test.sh    # Явно укажем интерпретатор
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