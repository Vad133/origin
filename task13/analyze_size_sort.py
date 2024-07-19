import os

def get_size(path):
    """Получает размер файла или директории в байтах."""
    if os.path.isfile(path):
        return os.path.getsize(path)
    elif os.path.isdir(path):
        total_size = 0
        for entry in os.listdir(path):
            entry_path = os.path.join(path, entry)
            total_size += get_size(entry_path)
        return total_size
    else:
        return 0

def format_size(size):
    """Форматирует размер файла в байтах в удобный для чтения формат."""
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if size < 1024.0:
            return f"{size:.1f} {unit}"
        size /= 1024.0

def main():
    """Основная функция скрипта."""
    current_dir = os.getcwd()
    print("Анализ размера файлов и директорий в:", current_dir)

    for entry in os.listdir(current_dir):
        entry_path = os.path.join(current_dir, entry)
        size = get_size(entry_path)
        if size > 0:  # Исключаем пустые файлы и директории
            print(f"{format_size(size)} - {entry}")

if __name__ == "__main__":
    main()
