⍝ https://projecteuler.net/problem=7
⍝
⍝ By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
⍝ that the 6th prime is 13.
⍝
⍝ What is the 10 001st prime number?

⍝ We can start by writing a function to list the first ⍵ primes (see solution
⍝ to problem 10 for the function from which this was modified, as well as an
⍝ expanded and commented version of that function). This function maintains a
⍝ list of prime numbers it has computed so far in order to speed up the check
⍝ for subsequent primes by only dividing by smaller primes (a 1/log(N)
⍝ speedup).
primes←{
    3 ⍵ 1{
        c s p←⍺
        s=⍴⍵:⍵
        n←c+2
        n s(p+⍵[p]≤n*0.5)∇ ⍵,(~0∊(p↑⍵)|c)/c
    }1⍴2
}

⍝ To solve the problem, we simply pick the last prime from the resulting list
⍝ of primes:
nth_prime←{
    ⊃¯1↑3 ⍵ 1{
        c s p←⍺
        s=⍴⍵:⍵
        n←c+2
        n s(p+⍵[p]≤n*0.5)∇ ⍵,(~0∊(p↑⍵)|c)/c
    }1⍴2
}
