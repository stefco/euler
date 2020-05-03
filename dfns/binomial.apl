⍝ ⍺ choose ⍵
choose←{f←(×/⍳)¨ ⋄ (f ⍺)÷(f ⍺-⍵)×f ⍵}

⍝ Create a binomial pyramid. Display with DISP from )copy util DISP
pyramid←{(⍵+1) 1⍴{⍵choose¯1+⍳1+⍵}¨¯1+⍳⍵+1}
