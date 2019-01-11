# Return true if a sublist is in a list

def prefix(x, y):
    # return true if x is a prefix of y
    # base case
    if len(x) == 0:
        return True

    if len(x) > len(y):
        return False

    if x[0] == y[0]:
        return prefix(x[1:], y[1:])
    
    return False

def sublist(x, y):
    ''' 
        Returns true if and only x is a sublist of y 
        ex: aabab has as sublists <empty>, a, aa, aab, aaba, aabab, ab, aba, abab, b, ba, bab
    '''
    
    # base case first
    if len(x) > len(y):
        return False

    if prefix(x, y):
        return True
    
    return sublist(x, y[1:])

def main():
    print(sublist("a", "aabab"))
    print(sublist("aa", "aabab"))
    print(sublist("aab", "aabab"))
    print(sublist("aaba", "aabab"))
    print(sublist("aabab", "aabab"))
    print(sublist("ab", "aabab"))
    print(sublist("abba", "aabab"))
    print(sublist("abab", "aabab"))
    print(sublist("aba", "aabab"))
    print(sublist("b", "aabab"))
    print(sublist("ba", "aabab"))
    print(sublist("bab", "aabab"))

main()