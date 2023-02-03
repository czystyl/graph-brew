INTERNAL_CONNECTION_STRING="postgres://postgres:eUPyjfZ2gw7o1Hu@4719c80b6fe911b091a7c05124b64eeece.fly.dev:5432"

CONNECTION_STRING=$(echo $INTERNAL_CONNECTION_STRING | sed "s/.internal:/.fly.dev:/g" | base64) 

echo $CONNECTION_STRING