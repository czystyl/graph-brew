vars=$(cat .vercel/.env.preview.local)

DATABASE_URL_KEY=DATABASE_URL_123

DB_REGEX="$DATABASE_URL_KEY=\"([^\"]*)\""

if [[ $vars =~ $DB_REGEX ]]; then
    echo ${BASH_REMATCH[1]}
else
    echo "No match"
fi