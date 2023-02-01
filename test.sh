  REGEX="(__VERCEL_PREVIEW_URL: )(.*)( -->)"
  COMMENT_BODY=""
  
  echo [[$COMMENT_BODY =~ $REGEX]]

  if [[ $COMMENT_BODY =~ $REGEX ]]; then
      echo "VERCEL_PREVIEW_URL=${BASH_REMATCH[2]}" >> $GITHUB_OUTPUT
  else
      echo "No previous Preview Environment"
  fi