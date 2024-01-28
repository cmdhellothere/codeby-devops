#!/bin/bash
USER=$(whoami)
DIR=/home/$USER/myfolder

if [ -d "$DIR" ]; then 

        # Определяет, как много файлов создано в папке myfolder

        count=$(ls -l $DIR/ | grep ^- | wc -l)
        echo "Количество файлов в папке $DIR/: $count"

        # Исправляет права второго файла с 777 на 664

        if [ -f $DIR/file2 ]; then  
                chmod 664 $DIR/file2
        else
                echo "script2.sh был запущен ранее, file2 удален. Для создания file2 запустите script1.sh"
        fi

        # Определяет пустые файлы и удаляет их

        find $DIR/ -type f -empty -delete

        # Удаляет все строки кроме первой в остальных файлах

        for file in $DIR/*; do
                sed -i '2,$d' $file
                echo "Все строки кроме первой удалены в файле $file"
        done    
else
        echo "Не создана папка $DIR/. Запустите скрипт script1.sh"
fi