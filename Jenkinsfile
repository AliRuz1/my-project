pipeline {
    agent {
        docker {
            image 'saruz/my-node-app:latest'
            args '-v $WORKSPACE:/app -w /app'  // Монтируем и устанавливаем рабочую директорию
        }
    }
    stages {
        stage('Prepare') {
            steps {
                sh '''
                    echo "=== Подготовка ==="
                    echo "Рабочая директория: $(pwd)"
                    echo "Содержимое:"
                    ls -la
                    echo "Скрипты:"
                    ls -la scripts/
                    chmod +x scripts/test.sh
                '''
            }
        }
 stage('Test') {
    steps {
        sh '''
            ./scripts/test.sh
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