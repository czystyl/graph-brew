  echo "4719c80b6fe911b091a7c05124"
  echo "cG9zdGdyZXM6Ly9wb3N0Z3Jlczp0T09QaVpIc1Z5RnI1dUFANDcxOWM4MGI2ZmU5MTFiMDkxYTdjMDUxMjQuZmx5LmRldjo1NDMyCg=="                  
  echo ""
  
  NEW_DATABASE_URL=$(echo "cG9zdGdyZXM6Ly9wb3N0Z3Jlczp0T09QaVpIc1Z5RnI1dUFANDcxOWM4MGI2ZmU5MTFiMDkxYTdjMDUxMjQuZmx5LmRldjo1NDMyCg==" | base64 -d)
  echo $NEW_DATABASE_URL
  EXISTING_DATABASE_URL=""         
  
  echo $NEW_DATABASE_URL
  echo $EXISTING_DATABASE_URL
  
  if [[ $NEW_DATABASE_URL ]]; then
    DATABASE_URL_KEY="DATABASE_URL_4719c80b6fe911b091a7c05124"
    
    # vercel env rm $DATABASE_URL_KEY --yes --token=*** || true
    # echo $NEW_DATABASE_URL | vercel env add $DATABASE_URL_KEY preview --token=***
    echo "DATABASE_URL=$NEW_DATABASE_URL" >> $GITHUB_ENV
  elif [[ $EXISTING_DATABASE_URL ]]; then
    echo "DATABASE_URL=$NEW_DATABASE_URL" >> $GITHUB_ENV
  else
    echo ops && exit 1
  fi