def main():
    print(gcd(10, 20))


def gcd(x, y):
    if x == 0:
        return y

    return gcd(y % x, x)


main()
