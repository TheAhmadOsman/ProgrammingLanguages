import disassembler
import sys

def main():
    print(list(range(0, int(input("Please enter an integer: "))+1, 2)))

if len(sys.argv) == 1:
	main()
else:
	disassembler.disassemble(main)