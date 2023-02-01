OUT="
## <0001f9d0> Your preview environment is ready! 🎉

### [https://graph-brew-a4ynmiu7g-productbrew.vercel.app](https://graph-brew-a4ynmiu7g-productbrew.vercel.app)

< __VERCEL_DEPLOYMENT -->
<!-- __VERCEL_PREVIEW_URL: asd -->"

REGEX="(__VERCEL_PREVIEW_URL: )(.*)( -->)"
[[ $OUT =~ $REGEX ]]

echo ${BASH_REMATCH[2]}


if [ ${BASH_REMATCH[2]} ]; then
    echo ${BASH_REMATCH[2]}
else
    echo "No previous Preview Environment"
fi