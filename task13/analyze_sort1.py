import os

def get_size(start_path='.'):
    """Функция для получения размера файла или директории"""
    total_size = 0
    if os.path.isfile(start_path):
        total_size = os.path.getsize(start_path)
    elif os.path.isdir(start_path):
        total_size = sum(os.path.getsize(os.path.join(start_path, f)) for f in os.listdir(start_path) if os.path.isfile(os.path.join(start_path, f)))
    return total_size

def main():
    # Получение списка всех файлов и директорий в текущей директории
    entries = os.listdir('.')
    
    # Получение размеров каждого файла и директории
    sizes = [(entry, get_size(entry)) for entry in entries]
    
    # Сортировка по уменьшению размера
    sizes.sort(key=lambda x: x[1], reverse=True)
    
    # Вывод результатов
    for entry, size in sizes:
        print(f"{entry}: {size} bytes")

if __name__ == "__main__":
    main()
