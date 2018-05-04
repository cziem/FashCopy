# #!/usr/bin/env bash

# echo Enter name:
# read name
# echo 'Enter friend: '
# read friend

# if [ $name ] && [ $friend ]; then
#     echo passed
#     echo
#     echo Your name is $name and your friends name is $friend
# elif [ ! $name ] && [ $friend ]; then
#     echo failed
#     echo
#     echo parameters too short
# fi


read -p "Do you wish to install this program?" yn
case $yn in
    [Yy]* ) echo yes; break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
esac