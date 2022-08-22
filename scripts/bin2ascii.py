import binascii

with open('lc3os.obj', 'rb') as f:
    hexdata = binascii.hexlify(f.read())

with open('lc3os.hex', 'w') as f:
    for i in range(0, len(hexdata), 4):
        f.write((hexdata[i: i + 4]).decode())
        f.write("\n")
