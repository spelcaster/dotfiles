#!/bin/sh

###############################################################################
# THIS BLOCK SHOULD BE REMOVED
echo "This script should not be used without providing new author information"
return 0
###############################################################################

git filter-branch --env-filter '
OLD_EMAIL="my_email@example.com"
NEW_NAME="Shurelous"
NEW_EMAIL="shurelous@example.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
