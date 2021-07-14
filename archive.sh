gethash() {
	cd $1
	val=$(git rev-parse --short HEAD)
	cd ..
	echo $val
}

check_archive_all() {
	git-archive-all -h 2&>/dev/null >/dev/null

	if [ ! "$?" = "0" ]
		then
		echo -e "\x1b[1;38;5;196mYou should install git-archive-all first.\x1b[0m"
		echo ""
		echo "For macOS systems with Homebrew, install it with:"
		echo "    brew install git-archive-all"
		echo "Otherwise, install it from pip:"
		echo "    pip install git-archive-all"
		exit 1
	fi
}

update_subm() {
	bash update.sh >/dev/null	
}


if [ "$1" = "--update" ]
then
	update_subm
fi

FE_HASH="$(gethash frontend)"
BE_HASH="$(gethash backend)"
FILENAME="archive-$FE_HASH-$BE_HASH.zip"

git-archive-all --force-submodules "$FILENAME"

# Output the FILENAME for the next task.
echo $FILENAME
