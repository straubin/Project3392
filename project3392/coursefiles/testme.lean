import Mathlib.Tactic

/- a formalized natural deduction proof from the start of the
class
-/

variable (car bus rain umbrella : Prop )

example (h₁: car ∨ bus )(h₂: bus ∧ rain → umbrella)(h₃: rain ∧ ¬umbrella):car :=
by
cases' h₁ with hc hb  /- we'll use or elimination to produce the conclusion
                      in for both modes of transport, This produces two
                      goals. -/
exact hc /-it's trivial if we assume he took the car!-/

/-if he took the bus, we need a contradiction-/
have hr: rain := And.left h₃
have hbr: bus ∧ rain := And.intro hb hr
have hu: umbrella := h₂ hbr
have hnu: ¬ umbrella := And.right h₃
exfalso
exact hnu hu
