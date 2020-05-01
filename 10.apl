⍝ https://projecteuler.net/problem=10
⍝
⍝ The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
⍝
⍝ Find the sum of all the primes below two million.

⍝ This solution stores all comparisons in memory and will therefore run out of
⍝ memory for large values.
+/1↓{s←⍳⍵⋄s2←{⍳⌈(⌈/⍵)*0.5} s⋄(0<×/⍉1↓(s2∘.|s)∨s2∘.≥s)/s}
