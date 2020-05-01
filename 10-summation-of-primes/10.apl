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
⍝ <30,000.
+/1↓{s←⍳⍵⋄s2←{⍳⌈(⌈/⍵)*0.5} s⋄(0<×/⍉1↓(s2∘.|s)∨s2∘.≥s)/s}

⍝ A recursive (serial) solution that only checks residue for primes smaller
⍝ than the square root of the number to be checked. Has lower memory usage but
⍝ still overflows in 8GB of memory for some number <800,000.
+/{⍵<2:⍬⋄p←∇⍵-1⋄p,(0<×/((p≤⌈⍵*.5)/p)|⍵)/⍵}
