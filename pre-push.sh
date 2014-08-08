#!/bin/sh

# rejects pushes to master if it's more than 1 commit
# that's to avoid merges without squash or other failures

current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
protected_branch='master'

if [[ $current_branch = $protected_branch ]]; then
	commits_number=$((`git log origin/master..HEAD --pretty=format:'%h' | wc -l` + 1))
	if [ $commits_number -ne 1 ]; then 
		echo "$(tput setaf 1)Hey you are pushing too many commits ($commits_number), please squash!$(tput sgr0)"
		exit 1
	fi
fi

exit 0