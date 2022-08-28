#!/usr/bin/env python3
import binascii
import sys


with open(sys.argv[1], 'rb') as f:
    hexdata = binascii.hexlify(f.read())

# improve this using PathLib -- OK for now
with open(sys.argv[1].split('.')[0] + '.hex', 'w') as f:
    for i in range(0, len(hexdata), 4):
        if i == 0:
            f.write("@")
        f.write((hexdata[i: i + 4]).decode())
        if i != 0:
            f.write("\n")
        else:
            f.write(" ")
