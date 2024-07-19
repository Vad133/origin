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

  # Вывод первых 10 элементов
  echo "$sorted_items" | head -n 10

  # Вывод последующих элементов порциями по 10
  remaining_items=$(echo "$sorted_items" | tail -n +11)
  while [ -n "$remaining_items" ]; do
    echo -n "Показать следующие 10 результатов? (y/n): "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
      echo "$remaining_items" | head -n 10
      remaining_items=$(echo "$remaining_items" | tail -n +11)
    else
      break
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
