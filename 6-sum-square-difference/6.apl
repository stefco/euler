⍝ https://projecteuler.net/problem=6
⍝
⍝ Find the difference between the sum of the squares of the first one hundred
⍝ natural numbers and the square of the sum.

⍝ Create a sequence of the first ⍵ integers. Square it elementwise, sum reduce,
⍝ and subtract from the square of the sum reduction.
sqsum_minus_sumsq←{a←⍳⍵⋄((+/a)*2)-+/a*2}

⍝ A tacit version:
sqsum_minus_sumsq_t←((((⊢×⊢)(+/⊢))-(+/⊢×⊢))(⍳⊢))
