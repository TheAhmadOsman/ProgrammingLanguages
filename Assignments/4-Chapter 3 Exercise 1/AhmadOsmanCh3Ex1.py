'''
Ahmad M. Osman
Chapter 3 Exercise 1
'''

import disassembler


def main():
    x = 5
    y = 6
    print(x if x > y else y)


disassembler.disassemble(main)
