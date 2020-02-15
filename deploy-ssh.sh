#!/bin/bash

whereSaveImages=$1

echo "Remove ${whereSaveImages}"
ssh $SSH_USER@$SSH_HOST "rm -r ${whereSaveImages} && mkdir ${whereSaveImages}"

echo "Copy ${whereSaveImages}"
scp -r "./${whereSaveImages}/" $SSH_USER@$SSH_HOST:~/
