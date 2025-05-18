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
            echo "=== Создаем новый тест ==="
            cat > /tmp/new_test.sh << 'EOF'
#!/bin/bash
echo "=== Тест запущен ==="
echo "Рабочая директория: $(pwd)"
echo "Node.js версия: $(node -v)"
[ -f "package.json" ] && echo "✓ package.json найден" || exit 1
echo "=== Тест пройден ==="
exit 0
EOF
            
            chmod +x /tmp/new_test.sh
            /tmp/new_test.sh
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