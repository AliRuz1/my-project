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
                    ls -la /var/jenkins_home/workspace/Pipe_please/scripts/test.sh
                    
                    # Даём права на выполнение
                    chmod +x /var/jenkins_home/workspace/Pipe_please/scripts/test.sh
                    
                    # Запускаем тест
                    /var/jenkins_home/workspace/Pipe_please/scripts/test.sh || exit 1  # Выходим с ошибкой если тест провален
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