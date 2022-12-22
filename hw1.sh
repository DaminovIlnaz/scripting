truee=0
falsee=0
RED_COLOR='\e[0;31m'
GREEN_COLOR='\e[0;32m'
RESET='\e[0m'
attempt=1

while (true)
do
read -p "Введите цифру в диапазоне [0;9]: " answer
echo "Попытка номер: $attempt"

case "${answer}" in 
    q)
        exit
    ;;

    [0-9])    ;;*)
        echo "Вводить можно только цифры в диапазоне [0;9]!"
    ;;
esac

attempt=$((attempt+1))

random_number=$(shuf -i 0-9 -n 1)
if [[ "${answer}" == "${random_number}" ]]
    then
        echo "Угадали, была загадана цифра:$random_number"
	truee=$((truee+1))
    else
        echo "Не угадали, была загадана цифра: $random_number"
		echo "Вы загадали: ${answer}"
	falsee=$((falsee+1))
fi

total=$(( truee + falsee ))
let truee_percent=truee*100/total
let falsee_percent=100-truee_percent

echo "Угадано: ${truee_percent}%" "Не угадано: ${falsee_percent}%"

if (( random_number != answer ))
then
	number_string="${RED_COLOR}${random_number}${RESET}"
else
    number_string="${GREEN_COLOR}${random_number}${RESET}"
fi
numbers+=(${number_string})

echo -e "Загаданные числа: ${numbers[@]}"
done