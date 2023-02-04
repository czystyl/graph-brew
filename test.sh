TEST_STRING="Hello World!"

TEST=$(echo $TEST_STRING | sed 's/ //g')

echo $TEST