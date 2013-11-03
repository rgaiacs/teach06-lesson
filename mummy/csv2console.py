# This is a simple script to read a CSV file and print it in the console.

import sys

def parse(fname):
    table = []
    # Read file
    with open(fname, 'r') as f:
        for l in f:
            table.append(l.strip().split(','))
    for j in range(len(table[0])):
        max_size = 0
        # Get longest field in column
        for i in range(len(table)):
            if len(table[i][j]) > max_size:
                max_size = len(table[i][j])
        # Add white space when need
        for i in range(len(table)):
            table[i][j] += (max_size - len(table[i][j])) * ' '
    
    # Print table
    for i in range(len(table)):
        for j in range(len(table[0])):
            print table[i][j],
        print ''

if __name__ == '__main__':
    if len(sys.argv) > 1:
        for f in sys.argv[1:]:
            parse(f)
    else:
        print "No input file."
