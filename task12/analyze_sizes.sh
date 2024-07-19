#!/bin/bash

# Функция для анализа размера файлов и директорий в текущей директории
analyze_size() {
  for item in "$1"/*; do
    if [ -d "$item" ]; then
      # Если элемент - директория, выводим её имя и размер
      echo "Directory: $item"
      du -sh "$item"
    elif [ -f "$item" ]; then
      # Если элемент - файл, выводим его имя и размер
      echo "File: $item"
      du -sh "$item"
    fi
  done
}

# Основная функция
main() {
  current_dir="."
  echo "Analyzing sizes in the directory: $current_dir"
  analyze_size "$current_dir"
}

# Вызов основной функции
main
