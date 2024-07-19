#!/bin/bash

# Функция для анализа размера файлов и директорий в текущей директории
analyze_size() {
  items=()
  for item in "$1"/*; do
    if [ -d "$item" ]; then
      size=$(du -sh "$item" | cut -f1)
      items+=("$size $item (Directory)")
    elif [ -f "$item" ]; then
      size=$(du -sh "$item" | cut -f1)
      items+=("$size $item (File)")
    fi
  done

  # Сортировка элементов по размеру в убывающем порядке
  sorted_items=$(printf "%s\n" "${items[@]}" | sort -hr)

  # Вывод отсортированных элементов
  echo "$sorted_items"
}

# Основная функция
main() {
  current_dir="."
  echo "Analyzing sizes in the directory: $current_dir"
  analyze_size "$current_dir"
}

# Вызов основной функции
main
