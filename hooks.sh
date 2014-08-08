#!/bin/sh

cp pre-push.sh .git/hooks
chmod +x .git/hooks/pre-push.sh
echo 'pre-push hook enabled!'

df
2