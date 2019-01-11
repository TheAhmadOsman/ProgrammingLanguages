#!/usr/bin/env python3
# encoding: UTF-8

'''
Ahmad M. Osman
Chapter 3 Exercise 1
'''

import disassembler


def main():
    class Student:
        def __init__(self, first_name_, second_name_, id_, advisor_):
            self._first_name = first_name_
            self._second_name = second_name_
            self._id = id_
            self._advisor = advisor_

        def first_name(self):
            return self._first_name

        def second_name(self):
            return self._second_name

        def id(self):
            return self._id

        def advisor(self):
            return self._advisor

        def __str__(self):
            return str(self._first_name, self._second_name, "id number", self._id, "advisor", self._advisor)

    s = Student("Ahmad", "Osman", 498102, "Dr. Kent Lee")
    print(s.first_name())
    print(s.second_name())
    print(s.id())
    print(s.advisor())

    s2 = Student("Mike", "Nathan", 357964, "Dr. Phil")
    print(s2.id())

if __name__ == "__main__":
    #main()
    disassembler.disassemble(main)
