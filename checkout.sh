VERSION=$1
touch filename-$VERSION.md

BRANCH_NAME=new/110

BRANCH_EXISTS="$(git ls-remote --exit-code --heads origin "$BRANCH_NAME" | wc -l)"

if [ "$BRANCH_EXISTS" -eq "1" ]; then
    git checkout "$BRANCH_NAME"
else
    git checkout -b "$BRANCH_NAME"
fi;

git add .
git commit -am "feat: added $VERSION"
git show HEAD
git push --set-upstream origin "$BRANCH_NAME"