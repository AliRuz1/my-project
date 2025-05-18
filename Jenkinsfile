pipeline {
    agent {
        docker {
            image 'saruz/my-node-app:latest'
            args '-v $WORKSPACE:/app'  // Монтируем проект в контейнер
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
                    echo "Проверяем наличие test.sh:"
                    ls -la /app/scripts/test.sh
                    chmod +x /app/scripts/test.sh
                    ${WORKSPACE}/scripts/test.sh
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