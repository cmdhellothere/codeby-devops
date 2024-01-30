#! bin/bash

################################
||                            ||
||    Автор: cmdhellothere    ||
||        дата: 01.23         ||
||                            ||
||   Пак тестовых скриптов    ||
||                            ||
################################

USER=$(whoami)
DIR=/home/$USER/myfolder
PS3='Директория и файлы уже созданы. Хотите удалить текущие директорию/файлы и создать новые? '
options=("Да" "Нет")


# Создание директории
if [ ! -d "$DIR/" ]; then 
        mkdir $DIR/
        # создать файл 1 - имеет две строки: 1) приветствие, 2) текущее время и дата
        touch $DIR/file1
        echo 'Hi mate! Its chewsday innit?' > $DIR/file1
        echo `date` >> $DIR/file1

        # создать файл 2 - пустой файл с правами 777
        touch $DIR/file2
        chmod 777 $DIR/file2

        # создать файл 3 - одна строка длиной в 20 случайных символов
        touch $DIR/file3
        echo `echo $RANDOM | md5sum | head -c 20; echo;` > $DIR/file3

        # создать файлы 4-5 пустые файлы
        touch $DIR/file4
        touch $DIR/file5
        
        echo 'А вот и файлы!'
        ls -la $DIR/

        else
                select opt in "${options[@]}"
                do
                case $opt in
                Да)
                rm -r $DIR/
                mkdir $DIR/
                touch $DIR/file1
                echo 'Hi mate! Its chewsday innit?' > $DIR/file1
                echo `date` >> $DIR/file1

                touch $DIR/file2
                chmod 777 $DIR/file2

                touch $DIR/file3
                echo `echo $RANDOM | md5sum | head -c 20; echo;` > $DIR/file3

                touch $DIR/file4
                touch $DIR/file5
                echo 'А вот и файлы!'
                ls -la $DIR/
                break
                ;;

                Нет)
                break
                ;;
                *) echo "Неправильная опция  $REPLY";;
                esac
                done
fi

