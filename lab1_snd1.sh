#!/bin/bash

echo "ФИО: Шабанов Н.Д."
echo "НАЗВАНИЕ: Удаление файлов больше определенного размера"
echo "ОПИСАНИЕ: Программа запрашивает путь к каталогу. Запрашивает размер файла. Удаляет файлы из каталога меньше этого размера, предварительно спросив подтверждение"


while true; do

	while true; do

		echo "Введите каталог, в котором бы хотели удалить файлы"
		read dir 

		sudo find / -type d -iname $dir

		echo "Мы нашли все совпадения, есть ли нужный путь? Y/N"
		read cmd
		if [ "$cmd" = "Y" ]
			then
			break
			else
			echo "Попробуем повторить? Y/N"
			read cmd
				if [ "$cmd" = "Y" ]
					then
					continue
					else
					exit 0
				fi
		fi
	done

	while true; do

		echo "Введите путь"
		read path

		if [ -e "$path" ]
			then cd "$path"
			break
			else
			echo "Вы ввели неверный путь, повторить? Y/N"
			read cmd
			if [ "$cmd" = "Y" ]
				then
				continue
				else
				echo "Exit"
				exit 0
			fi
		fi
	done


	re='^[0-9]+$'

	while true; do

		echo "Введите размер файлов в Кб, все файлы меньше этого размера будут удалены"
		read num

		if [[ $num =~ $re ]]
			then 
			break
			else 
			echo "Вы ввели неверное число, повтороить? Y/N"
			read cmd
			if [ "$cmd" = "Y" ]
				then
				continue
				else
				echo "Exit"
				exit 0
			fi
		fi
	done

	echo "Все файлы меньше выбранного размера будут удалены, удалить? Y/N"
	read cmd

	if [ "$cmd" = "Y" ]
		then
		find $path -size -"$num"k -delete
		echo "Файлы удалены. Хотите повтороить все заново? Y/N"
		read cmd
			if [ "$cmd" = "Y" ]
				then
				continue
				else 
				exit 0
			fi
		else 
		echo "Файлы не удалены. Хотите повтороить все заново? Y/N"
		read cmd
		if [ "$cmd" = "Y" ]
			then
			continue
			else 
			break
		fi
	fi
done
