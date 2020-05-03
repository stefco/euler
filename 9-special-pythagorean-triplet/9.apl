⍝ https://projecteuler.net/problem=10
⍝
⍝ A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
⍝
⍝       (a*2) + (b*2) = (c*2)
⍝
⍝ For example, (3*2) + (4*2) = 9 + 16 = 25 = 52.
⍝
⍝ There exists exactly one Pythagorean triplet for which a + b + c = 1000.
⍝ Find the product abc.

⍝ A function to find the products of all pythagorean triples (a b c) summing to
⍝ the provided argument. Gives one value for each triple found. Remove `×/` 
⍝ to get a matrix of the triples, with each triple found on its own row.
pyth←{
    ×/{((⊃⍴⍵)÷3)3⍴⍵}⊃,/⍵{           ⍝ reshape result array and take product
        n←⍺-⍵                         ⍝ a+b
        a←⍳⌊0.5×n                     ⍝ check values of a where a≤b
        m←⍸(⍵*2)=((n-a)*2)+(a*2)      ⍝ matching values of a; recall b=n-a
        ⊃,/m(n-m)((⍴m)⍴⍵)             ⍝ a concatenated list of triples (a b c)
    }¨⍳⍵-2                            ⍝ 1≤(a b c)
}

⍝ A simplified version that immediately takes the product abc when a match is
⍝ found. This disposes of the result array reshaping since the result is simply a
⍝ list of products of matching triples.
pyth_simple←{
    ⊃,/⍵{
        n←⍺-⍵
        a←⍳⌊0.5×n
        m←⍸(⍵*2)=((n-a)*2)+a*2
        ⍵×m×n-m
    }¨⍳⍵-2
}
