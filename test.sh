# APP_NAME="hello-world-12"

# DB_CONNECTION_STRING=""
# DB_POSTGRES_IMAGE_VERSION=""

# PG_CREATE_COMMAND="
#     fly postgres create \
#     --name $APP_NAME \
#     --org product-brew \
#     --region waw \
#     --vm-size shared-cpu-1x - 256 \
#     --initial-cluster-size 1 \
#     --volume-size 10 \
#     --image-ref flyio/postgres:14
# "

# PG_CREATE_OUTPUT=$($PG_CREATE_COMMAND)
# REGEX="(Connection string: )(.*)( Save)"

# if [[ $(echo $PG_CREATE_OUTPUT) =~ $REGEX ]]; then
#     DB_CONNECTION_STRING=${BASH_REMATCH[2]}
# else
#     echo "OPS problem"
#     exit 1
# fi

# echo $DB_CONNECTION_STRING


# fly ips allocate-v4 --app $APP_NAME


# IMAGE_OUTPUT=$(fly image show --app $APP_NAME)
# REGEX="(flyio/postgres )(.*)( v0)"
# if [[ $(echo $IMAGE_OUTPUT) =~ $REGEX ]]; then
#     DB_POSTGRES_IMAGE_VERSION=${BASH_REMATCH[2]}
# else
#     echo "OPS problem"
#     exit 1
# fi

# sed "s/__APP_NAME_TEMPLATE__/$APP_NAME/g" fly_postgres_template.toml > fly.toml

# fly deploy \
#     --app $APP_NAME \
#     --image flyio/postgres:${DB_POSTGRES_IMAGE_VERSION} \
#     --auto-confirm


ORG="postgres://postgres:ez2O3g4gqTlmy6d@hello-world-12.internal:5432"

echo $ORG | sed "s/.internal:/.fly.dev:/g" | base64 