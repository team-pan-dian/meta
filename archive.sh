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

FILENAME="archive-$(date +"%Y-%m-%d-%H-%M-%S").zip"
git-archive-all --force-submodules "$FILENAME"
echo $FILENAME
