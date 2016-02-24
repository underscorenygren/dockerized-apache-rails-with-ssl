NAME=server
ssh-keygen -f $NAME.key
openssl req -new -key $NAME.key -out $NAME.csr
openssl x509 -req -days 365 -in $NAME.csr -signkey $NAME.key -out $NAME.crt
