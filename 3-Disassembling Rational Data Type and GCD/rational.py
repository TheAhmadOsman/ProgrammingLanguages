import disassembler

def gcd(x, y):
    if x==0:
        return y
    return gcd(y%x, x)

class Rational:
    def __init__(self, numerator, denominator):
        self.numerator = numerator//gcd(numerator, denominator)
        self.denominator = denominator//gcd(numerator, denominator)
        
    def getNumerator(self):
        return self.numerator
    def getDenominator(self):
        return self.denominator

    def __mul__(self, other):
        return Rational(self.getNumerator()*other.getNumerator(), self.getDenominator()*other.getDenominator())
    def __add__(self, other):
        return Rational((self.getNumerator()* other.getDenominator() + other.getNumerator()* self.getDenominator()), (self.getDenominator()* other.getDenominator()))
    
    def __str__(self):
        return str(self.numerator) + "/" + str(self.denominator)    
        
def main():
    print(Rational(1,2)+Rational(2,3))
    print(Rational(1,2)*Rational(2,3))
disassembler.disassemble(gcd)   
disassembler.disassemble(Rational)
disassembler.disassemble(main)
