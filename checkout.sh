VERSION=$1

BRANCH_NAME=new/210

BRANCH_EXISTS="$(git ls-remote --exit-code --heads origin "$BRANCH_NAME" | wc -l)"
echo $BRANCH_EXISTS

if [ "$BRANCH_EXISTS" -eq "1" ]; then
    echo "1"
    git checkout "$BRANCH_NAME"
else
    echo "2"
    git checkout -b "$BRANCH_NAME"
fi;

touch filename-$VERSION.md

git add .
git commit -am "feat: added $VERSION"
git show HEAD
git push origin "$BRANCH_NAME"