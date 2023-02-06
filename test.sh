vars=$(cat .vercel/.env.preview.local)

DATABASE_URL_KEY=DATABASE_URL_123

DB_REGEX="$DATABASE_URL_KEY=\"([^\"]*)\""

if [[ $vars =~ $DB_REGEX ]]; then
    echo ${BASH_REMATCH[1]}
else
    echo "No match"
fi


DB="0b6fe911b091a7c05124.fly.dev:5432\n"

# remove new line using sed
DB=$(echo $DB | sed 's/\\n//g')

echo $DB

