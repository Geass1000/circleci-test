#!/bin/bash

folderPath=$1

folderName=$(basename $folderPath)
echo "Remove ${folderName} folder from remote service"
ssh $SSH_USER@$SSH_HOST "rm -r ${folderName} && mkdir ${folderName}"

echo "Copy ./dist/${folderName} folder to remote server"
scp -r ${folderPath} $SSH_USER@$SSH_HOST:~/
