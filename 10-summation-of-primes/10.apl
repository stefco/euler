⍝ https://projecteuler.net/problem=10
⍝
⍝ The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
⍝
⍝ Find the sum of all the primes below two million.

⍝ This solution stores all comparisons in memory and will therefore run out of
⍝ memory for large values. It is also avoids any optimizations besides
⍝ terminating checks at the square root of the value being considered. However,
⍝ it is explicitly parallel, and therefore can be run quickly in a distributed
⍝ fashion if enough processors and memory are available. Memory exhaustion at
⍝ <30,000. O(N*1.5÷log(N)) in time and space.
psum_parallel←{+/1↓{s←⍳⍵⋄s2←{⍳⌈(⌈/⍵)*0.5} s⋄(0<×/⍉1↓(s2∘.|s)∨s2∘.≥s)/s}⍵}

⍝ A (non-tail-call) recursive (serial) solution that only checks residue for
⍝ primes smaller than the square root of the number to be checked. Has lower
⍝ memory usage but still overflows in 8GB of memory for some number <800,000.
⍝ Basic idea is O(N*1.5÷log(N)) in time, but is really N*2÷log(N) due to the
⍝ (p≤⌈⍵*.5) check.
psum_stack_recurse←{+/{⍵<2:⍬⋄p←∇⍵-1⋄p,(~0∊((p≤⌈⍵*.5)/p)|⍵)/⍵}⍵}

⍝ A tail-recursive version operating in O(N*1.5÷log(N)) time and skipping even
⍝ values. Dyalog APL's tail-call optimization avoids stack overflow.
psum_tail_recurse_messy←{
    x←⌊⍵      ⍝ take the floor (looking for primes <)
    x<2:⍬     ⍝ no primes < 2
    x=2:1⍴2   ⍝ 2 is the only even prime; special case
    +/3 x 1{  ⍝ ⍺←# to check, stopping value, #primes to compare
        ⍺[1]>⍺[2]:⍵   ⍝ have checked all < x; terminate
        s←⍺[3]↑⍵      ⍝ divide by smaller primes to check
        n←⍺[1]+2      ⍝ next number to check (skip even)
        j←⍺[3]+s{     ⍝ extend next ⍺[3]?
            (⍵*0.5)<(-1)↑⍺:0  ⍝ include next prime in check list if it is
            1                 ⍝   ≥ sqrt of next num to check
        }n
        c←0∊s|⍺[1]    ⍝ is current # composite?
        p←⍺[1] c{     ⍝ list of primes including current # if prime
            ⍺[2]:⍵            ⍝ current # composite, do not append
            ⍵,⍺[1]
        }⍵
        n(⍺[2])j∇p    ⍝ tail call for next step
    }1⍴2      ⍝ ⍵←list of primes less than current prime
}

⍝ A (significantly) cleaned up version of the tail-recursive version above.
⍝ Also somewhat faster.
psum_tail_recurse←{
    ⍵<3:(0⌈⌊⍵-1)↑1⍴2
    +/3 ⍵ 1{
        c s p←⍺
        c>s:⍵
        n←c+2
        n s(p+⍵[p]≤n*.5)∇⍵,(~0∊(p↑⍵)|c)/c
    }1⍴2
}
