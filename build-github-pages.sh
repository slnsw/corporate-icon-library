#!/usr/bin/env bash
# Github Pages builder.

$(git rev-parse --verify gh-pages &> /dev/null)
GH_PAGES_BRANCH_EXISTS=$?

if [[ "$GH_PAGES_BRANCH_EXISTS" == "0" ]]; then
  git checkout gh-pages
else
  echo "Creating gh-pages branch."
  git checkout -b gh-pages
fi

cp -r icomoon/* ./

git add .
git commit -m "Updated gh-pages"
git push origin gh-pages
git checkout master
