#!/bin/bash

# Проверка количества параметров
if [ $# -lt 2 ] || [ $# -gt 4 ]; then
    echo "Не верный формат вызова:"
    echo "tkprof <Сырой trace-файл> <Название выходного файла> [sort=prsela,fchela,exeela] [sys=no] "
    exit 1
fi

# Проверка существования входного файла
if [ ! -f "$1" ]; then
    echo "Ошибка: файл '$1' не существует в текущей директории"
    exit 1
fi

# Инициализация переменных параметров
ARG1="$1"
ARG2="$2"
ARG3=""
ARG4=""

# Распределение параметров по признакам
for arg in "${@:3}"; do
    if [[ "$arg" == sort=* ]]; then
        ARG3="$arg"
    elif [[ "$arg" == sys=* ]]; then
        ARG4="$arg"
    else
        echo "Ошибка: дополнительные параметры должны начинаться с sort= или sys="
        exit 1
    fi
done

# Проверка: существует ли образ tkprof
if ! docker image inspect tkprof > /dev/null 2>&1; then
    echo "Ошибка: образ 'tkprof' не найден."
    exit 1
fi

# Выполнение tkprof в контейнере
docker run --rm \
  -v "$(pwd)":/trace \
  tkprof "$ARG1" "$ARG2" "$ARG3" "$ARG4"