-- example from the preprint

import examples/id;

-- proof of the associativity of addition
-- plus x (plus y z) = plus (plus x y) z
plus : forall (x : Nat) (y : Nat). Nat;
plus =
    \ (x : Nat) (y : Nat) ->
        elim Nat
            (\ (_ : Nat) -> Nat )
            y
            ( \(x1 : Nat) (rec : Nat) -> Succ rec ) x;

$x : Nat; $y : Nat; $z : Nat;

e1 = (plus $x (plus $y $z));
e2 = (plus (plus $x $y) $z);
(res1, proof1) = sc e1;
(res2, proof2) = sc e2;

eq_e1_res1 : Id Nat e1 res1;
eq_e1_res1 = proof1;

eq_e2_res2 : Id Nat e2 res2;
eq_e2_res2 = proof2;

eq_res1_res2 : Id Nat res1 res2;
eq_res1_res2 = Refl Nat res1;
-- deriving equality
eq_e1_e2 : Id Nat e1 e2;
eq_e1_e2 =
    proof_by_sc Nat e1 e2 res1 proof1 proof2;

