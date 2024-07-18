function movecur() {
	printf "\033[%s;%sH" "$1" "$2"
}

while true
do
	read -n 1 keypressed
	if [[ "$keypressed" = "8" ]]; then
		printf "\033[2K\033[4Dyes"
	else
		printf "\033[2K\033[4DNO"
	fi
done
