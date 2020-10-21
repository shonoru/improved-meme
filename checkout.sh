VERSION=$1
touch filename-$VERSION.md

BRANCH_NAME=new/120

BRANCH_EXISTS="$(git ls-remote --exit-code --heads origin "$BRANCH_NAME" | wc -l)"
echo $BRANCH_EXISTS

if [ "$BRANCH_EXISTS" -eq "1" ]; then
    echo "1"
    git checkout "$BRANCH_NAME"
else
    echo "2"
    git checkout -b "$BRANCH_NAME"
fi;

git add .
git commit -am "feat: added $VERSION"
git show HEAD
git push --set-upstream origin "$BRANCH_NAME"