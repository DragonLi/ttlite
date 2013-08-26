import "examples/product.hs";
import "examples/nat.hs";
import "examples/fin.hs";

pr1 :: forall (A :: Set) (B :: Set) (_ :: Product A B) . Product B A;
pr1 = (\ (A :: Set) (B :: Set) (p :: Product A B) -> Pair (Product B A) (snd A B p) (fst A B p));

-- Exercise 4.1
-- (A /\ B) /\ C => A /\ (B /\ C)
th2 =
    forall
        (A :: Set)
        (B :: Set)
        (C :: Set)
        ( _ :: Product (Product A B) C) .
            Product A (Product B C);

-- p1 = fst (Product A B) C p
-- a = fst A B p1 = fst A B (fst (Product A B) C p)
-- b = snd A B p1 = snd A B (fst (Product A B) C p)
-- c = snd (Product A B) C p
-- (b, c) = Pair B C b c = Pair B C (snd A B (fst (Product A B) C p)) (snd (Product A B) C p)
-- (a, (b, c)) = Pair A (Product B C) a (b, c) =
--   =  Pair A (Product B C) (fst A B (fst (Product A B) C p)) (Pair B C (snd A B (fst (Product A B) C p)) (snd (Product A B) C p))
pr2 :: th2;
pr2 =
    (\(A :: Set) (B :: Set) (C :: Set) (p :: Product (Product A B) C) ->
        Pair (Product A (Product B C))
            (fst A B (fst (Product A B) C p))
            (Pair (Product B C) (snd A B (fst (Product A B) C p)) (snd (Product A B) C p)));


even    = natFold Bool True not;
odd     = natFold Bool False not;
isZero  = natFold Bool True (\  (_ :: Bool) -> False);
isSucc  = natFold Bool False (\ (_ :: Bool) -> True);