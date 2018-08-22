#!/bin/sh


read -p "Input repo name " repo_name
read -p "Input GIT username " uname
read -p "Input GIT Password " pass
read  -p "Enter Email Address " email
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u $uname https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

git init
git add .
git commit -m "`date` new1" .
git remote add origin  https://github.com/$uname/$repo_name.git
git config --global user.name "$uname"
git config --global user.email $email
git push origin master

#curl -u 'santoshvermalaitkor' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"~
