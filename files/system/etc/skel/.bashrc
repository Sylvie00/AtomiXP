echo ""
echo "AtomiXP [Version 6.7.69420]"
echo "(C) Copyright 2025 AtomiXP Project"
echo ""

PS1='\n\[\e[37m\]$(pwd | sed "s|^$HOME|C:\\\\Users\\\\$USER|;s|/|\\\\|g;s|^[^C]|C:\\\\|")\[\e[0m\]> '