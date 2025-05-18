pipeline {
    agent {
        docker {
            image 'saruz/my-node-app:latest'
            args '-v $WORKSPACE:/app'  // Монтируем рабочую директорию
        }
    }
    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh '''
                    echo "Проверяем test.sh:"
                    ls -la /app/scripts/test.sh
                    
                    # Даём права на выполнение
                    chmod +x /app/scripts/test.sh
                    
                    # Запускаем тест
                    /app/scripts/test.sh || exit 1  # Выходим с ошибкой если тест провален
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