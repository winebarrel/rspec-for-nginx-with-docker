#!/bin/bash
NAME=$1

openssl req \
  -new \
  -newkey rsa:2048 \
  -nodes \
  -subj "/C=AU/ST=Some-State/O=Internet Widgits Pty Ltd/CN=$NAME" \
  -keyout $NAME.key -out $NAME.csr

openssl ca -batch -out $NAME.crt -infiles $NAME.csr
rm $NAME.csr
openssl verify -verbose -CAfile root.crt $NAME.crt
