VAR="postgres://postgres:eE7F4AsNCeSiRE4@4719c80b6fe911b091a7c05124.fly.dev:5432


a"

# remove new line and space using sed
VAR=$(echo $VAR | sed 's/ //g' | sed 's/\n//g')

echo $VAR