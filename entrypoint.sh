#!/bin/bash

kcpserver -t 127.0.0.1:8989 -l :29900 -mode fast2 -mtu 1200 -datashard 0 -parityshard 0 -sndwnd 2048 -rcvwnd 1024 -nocomp true 2>&1 &

ss-server -s 0.0.0.0 -p 8989 -m aes-256-gcm -k 131415 --fast-open &

udpraw -s -l0.0.0.0:8855 -r 127.0.0.1:29900 -k "131415" --lower-level auto --raw-mode faketcp -a
