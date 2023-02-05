vars=$(cat .vercel/.env.preview.local)

DATABASE_URL_KEY=DATABASE_URL_123

echo $DATABASE_URL_KEY

DB_REGEX="$DATABASE_URL_KEY=\"(.*)\"[[:space:]]"

echo $DB_REGEX

if [[ $vars =~ $DB_REGEX ]]; then
    # echo "DATABASE_URL=${BASH_REMATCH[1]}" >> $GITHUB_ENV
    echo ${BASH_REMATCH[1]}

else
    echo "No match"
fi