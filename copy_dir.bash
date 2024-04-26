#!/bin/bash

# Проверяем, что введена директория для копирования
if [ -z "$1" ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Проверяем, что введена директория, куда будем копировать
if [ -z "$2" ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Проверяем, что исходная директория существует
if [ ! -d "$1" ]; then
    echo "Source directory does not exist!"
    exit 1
fi

# Проверяем, что директория для копирования существует или создаем её
if [ ! -d "$2" ]; then
    mkdir -p "$2"
fi

# Копируем все файлы из исходной директории в целевую директорию
find "$1" -type f -exec cp --backup=numbered {} "$2" \;
