DB_CREATE_COMMAND="
    flyctl postgres create \
        --name $BRANCH_PREVIEW_HASH \
        --org product-brew \
        --region waw \
        --vm-size shared-cpu-1x - 256 \
        --initial-cluster-size 1 \
        --volume-size 1 \
        --image-ref flyio/postgres:14"

DB_CREATE_OUTPUT=$($DB_CREATE_COMMAND)
DB_CREATE_OUTPUT_STRING=$(echo $DB_CREATE_OUTPUT | tr '\n' ' ' | sed "s/ //g")

REGEX="Connectionstring:(.*)Save"

if [[ $DB_CREATE_OUTPUT_STRING =~ $REGEX ]]; then
    INTERNAL_CONNECTION_STRING=${BASH_REMATCH[1]}
else
    echo "Failed to create database:" $DB_CREATE_OUTPUT
    exit 1
fi

if [ -z "$INTERNAL_CONNECTION_STRING" ]; then
    echo "INTERNAL_CONNECTION_STRING is empty"
    exit 1
fi

# Assign a public IP to the DB
flyctl ips allocate-v4 --app $BRANCH_PREVIEW_HASH

# Create a fly.toml file for the database and deploy it
sed "s/__APP_NAME_TEMPLATE__/$BRANCH_PREVIEW_HASH/g" fly_postgres_template.toml >fly.toml
flyctl deploy --image flyio/postgres:14 --auto-confirm

# Replace the internal connection string with the public one
CONNECTION_STRING=$(echo -n $INTERNAL_CONNECTION_STRING | sed "s/.internal:/.fly.dev:/g")

# Set the connection string as an environment variable for the next step
echo "NEW_DATABASE_URL=$CONNECTION_STRING" >>$GITHUB_ENV
