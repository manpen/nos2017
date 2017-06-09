#!/usr/bin/python3
# convert.py
# 
# converts tikz turing machines into sed executable turing machines
# usage:
# ./convert.py TURING_MACHINE.tex > TURING_MACHINE.sed
# echo INITIAL_TAPE_CONTENT | sed -f TURING_MACHINE.sed
# uses mainly str.split() and str.find() to 

import sys

def transition(old,new,read,write,direction):
    if direction == "L":
        print("s/^"+old+":\(.*\)\(.\)@"+read+"\(.*\)$/"+new+":\\1@\\2"+write+"\\3/;t loop")
    if direction == "R":
        print("s/^"+old+":\(.*\)@"+read+"\(.*\)$/"+new+":\\1"+write+"@\\2/;t loop")

with open(sys.argv[1], 'r') as f:
  for line in f.read().split("\n"):
    if "\\tmtrans" in line:
        this_state = line.split("{")[1].split("}")[0].split(".")[0]
        next_state = line.split("{")[2].split("}")[0].split(".")[0]
        for a in line.split("{")[3].split("}")[0].split(" "):
            if len(a) != 3: continue
            transition(this_state,next_state,a[0],a[1],a[2])
    if "\\tmstart" in line:
        init_state = line.split("{")[1].split("}")[0].split(".")[0]
        print("s/^B*\([^:B]*\)B*$/"+init_state+":B@\\1B/")
        print(":loop\ns/:@/:B@/g\ns/@$/@B/\np")
print("s/@//\ns/^[^:]*:B*\([^B]*\)B*$/\\1/")
