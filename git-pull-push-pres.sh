#!/bin/bash
#
#
#   Git pull then push in each repo
#   -- copy into directory containing repos in dirArray
#   -- add new repos to dirArray
#   -- set the cache to timeout after 1 hour (setting is in seconds) - avoid reauth during git push
#       $ git config --global credential.helper 'cache --timeout=3600'


dirArray=("basics-pres" "cartography-pres" "data-collection-pres" "data-hygiene-pres" "spatial-analysis-pres")

echo -n "Enter git commit message [press ENTER]: "
read MESSAGE

for i in "${dirArray[@]}"
do
  echo "moving in ${i} directory..."
  cd $i
  echo "git pulling..."
  git pull
  echo "git pull complete..."
  echo "git pushing..."
  git add --all
  git commit -m "$MESSAGE"
  git push
  echo "git push complete..."
  echo "...${i} complete."
  cd ../
done

