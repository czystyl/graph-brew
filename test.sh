vars=$(cat .vercel/.env.preview.local)

DB_REGEX='DATABASE_URL="(.*)"[[:space:]]'

if [[ $vars =~ $DB_REGEX ]]; then
  echo ${BASH_REMATCH[1]}
fi


