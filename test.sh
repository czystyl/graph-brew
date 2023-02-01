OUT="
## <0001f9d0> Your preview environment is ready! 🎉

### [https://graph-brew-a4ynmiu7g-productbrew.vercel.app](https://graph-brew-a4ynmiu7g-productbrew.vercel.app)

< __VERCEL_DEPLOYMENT -->
<!-- __VERCEL_PREVIEW_URL: asd -->"

  REGEX="(__VERCEL_PREVIEW_URL: )(.*)( -->)"
  COMMENT_BODY=""
  
  [[ $COMMENT_BODY =~ $REGEX ]]
  
  if [[ ${BASH_REMATCH[2]} ]]; then
      echo "VERCEL_PREVIEW_URL=${BASH_REMATCH[2]}" >> $GITHUB_OUTPUT
  else
      echo "No previous Preview Environment"
  fi