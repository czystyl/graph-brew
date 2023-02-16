BRANCH_PREVIEW_HASH=$(echo "$GITHUB_HEAD_REF" | sha256sum | cut -c5-30)

echo "Branch hash:" $BRANCH_PREVIEW_HASH

echo "BRANCH_PREVIEW_HASH=$BRANCH_PREVIEW_HASH" >>$GITHUB_ENV
echo "DATABASE_URL_KEY=DATABASE_URL_$BRANCH_PREVIEW_HASH" >>$GITHUB_ENV
