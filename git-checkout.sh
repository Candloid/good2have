#!/bin/bash
# Lists the available git branches and prompts the user to checkout one
branches=`git branch | sed 's/[\*, ]//g'`
options=("quit")
options+=( $(grep "[a-z]" <<< $branches) )


PS3='Please enter your choice: '

function checkout_choice() {
    echo "Checking out $opt"
    git checkout $opt
}

select opt in "${options[@]}"
do
    case $opt in
      "quit") echo bye; break;;
      *) checkout_choice; break;;
    esac
done