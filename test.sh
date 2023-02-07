PG_CREATE_OUTPUT="Creating postgres cluster in organization product-brew Creating app... Setting secrets on app 4719c80b6fe911b091a7c05124... Provisioning 1 of 1 machines with image flyio/postgres:14 Waiting for machine to start... Machine 148e132b73e489 is created ==> Monitoring health checks Postgres cluster 4719c80b6fe911b091a7c05124 created Username: postgres Password: FCvuXNtfrR7CUdO Hostname: 4719c80b6fe911b091a7c05124.internal Proxy port: 5432 Postgres port: 5433 Connection string: ***4719c80b6fe911b091a7c05124.internal:5432 Save your credentials in a secure place -- you won't be able to see them again! Connect to postgres Any app within the Product Brew organization can connect to this Postgres using the above connection string Now that you've set up Postgres, here's what you need to understand: https://fly.io/docs/postgres/getting-started/what-you-should-know/"

          TEST=$(echo $PG_CREATE_OUTPUT |  tr '\n' ' ' | sed "s/ //g")

# PG_CREATE_OUTPUT="${PG_CREATE_OUTPUT//[$'\t\r\n ']}"
REGEX="Connectionstring:(.*)Save"

if [[ $TEST =~ $REGEX ]]; then
INTERNAL_CONNECTION_STRING=${BASH_REMATCH[1]}
fi

echo $INTERNAL_CONNECTION_STRING
echo 9