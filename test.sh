ENV_VARS=$(cat .vercel/.env.preview.local)
DB_REGEX="DATABASE_URL_7ef9d15018bb3e21d1eb9a6a56=\"([^\"]*)\""

if [[ $ENV_VARS =~ $DB_REGEX ]]; then
    DATABASE_URL=${BASH_REMATCH[1]}
fi

if pg_isready -d "$DATABASE_URL" >/dev/null 2>&1; then
    EXISTING_URL=$(echo -n $DATABASE_URL | base64 | tr '\n' ' ' | sed "s/ //g")
    # echo "url=$EXISTING_URL" >>$GITHUB_OUTPUT
fi

echo $EXISTING_URL
