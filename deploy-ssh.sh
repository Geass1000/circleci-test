#!/bin/bash

whereSaveImages=$1

ssh $SSH_USER@$SSH_HOST "rm -r ${whereSaveImages} && mkdir ${whereSaveImages}"
scp -r "./${whereSaveImages}/" $SSH_USER@$SSH_HOST:~/
