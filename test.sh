ALIASES=$(vercel alias ls)         

echo "$ALIASES"

URL=$(echo "$ALIASES" | grep "6a5e1ea31edff9406bb623de27.*" | awk '{print $1}')
echo $URL