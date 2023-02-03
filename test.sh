APP_NAME="hello-world-998"


flyctl apps destroy $APP_NAME --yes

echo "deleted, creating new"

PG_CREATE_COMMAND="
    flyctl postgres create \
        --name hello-world-998 \
        --org product-brew \
        --region waw \
        --vm-size shared-cpu-1x - 256 \
        --initial-cluster-size 1 \
        --volume-size 1 \
        --image-ref flyio/postgres:14
"

PG_CREATE_OUTPUT=$($PG_CREATE_COMMAND)

echo "created"

echo $PG_CREATE_OUTPUT

REGEX="(Connection string: )(.*)( Save)"

if [[ $(echo $PG_CREATE_OUTPUT) =~ $REGEX ]]; then
    INTERNAL_CONNECTION_STRING=${BASH_REMATCH[2]}
else
    echo "OPS problem"
    exit 1
fi


echo $INTERNAL_CONNECTION_STRING
echo $INTERNAL_CONNECTION_STRING | base64
echo $INTERNAL_CONNECTION_STRING | sed "s/.internal:/.fly.dev:/g"
echo $INTERNAL_CONNECTION_STRING | sed "s/.internal:/.fly.dev:/g" | base64


