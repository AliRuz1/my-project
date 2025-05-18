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
            echo "=== Встроенный тест ==="
            # Проверка Node.js
            node -v || exit 1
            
            # Проверка package.json
            if [ ! -f "package.json" ]; then
                echo "ОШИБКА: package.json не найден"
                exit 1
            fi
            
            echo "✓ Все проверки пройдены"
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