  content="cG9zdGdyZXM6Ly9wb3N0Z3Jlczp2OUxYeGFoanFYREhzNGFANDcxOWM4MGI2ZmU5MTFiMDkxYTdj
MDUxMjQuZmx5LmRldjo1NDMyCg=="                  
  


# remove new line from content using sed
    content=$(echo $content | sed 's/\ //g')
echo $content