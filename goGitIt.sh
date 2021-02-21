
#!/bin/bash
CONFIGFILE="`pwd`/.git/config"
#echo $CONFIGFILE
REPO="https://github.com/$(cat $CONFIGFILE | grep '.git' | sed -e 's#.*= \(\)#\1#'|sed 's/.*:\(.*\)\.git/\1/')"
#echo $REPO
BRANCH="$REPO/tree/$(grep -o '".*"' $CONFIGFILE | sed 's/"//g' | grep -i "ii-")"
#echo $BRANCH
#/usr/bin/open "/Applications/Google Chrome.app" "$REPO"
/usr/bin/open "/Applications/Google Chrome.app" "$BRANCH"
