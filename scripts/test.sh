#!/bin/bash

# Простой тестовый скрипт для Jenkins pipeline

echo "=== Запуск тестов ==="

# Тест 1: Проверка существования файла package.json
if [ -f "package.json" ]; then
  echo "✓ package.json существует"
else
  echo "✗ Ошибка: package.json не найден"
  exit 1
fi

# Тест 2: Проверка версии Node.js
node_version=$(node -v)
echo "Версия Node.js: $node_version"

# Тест 3: Запуск простого JavaScript-теста
echo "console.log('Тест выполнен успешно');" > test.js
node test.js

echo "=== Тесты завершены ==="

# Все тесты пройдены
exit 0