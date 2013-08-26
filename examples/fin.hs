import "examples/core.hs";

Void = Fin_0;
-- unit type
Unit = Fin_1;
-- constructor
U = finElem_1_1;

-- booleans
Bool = Fin_2;
-- constructors
False = finElem_1_2;
True  = finElem_2_2;

abort =
    \(m :: Set) (v :: Void) -> elim Fin_0 ( \(_ :: Void) -> m) v;

boolElim =
    \ (m :: forall (_ :: Fin_2) . Set) (c1 :: m False) (c2 :: m True) (b :: Fin_2) .
        elim Fin_2 m c1 c2 b;

--Prop = boolElim (\ (_ :: Bool) -> Set) Void Unit;

not = boolElim (\ (_ :: Bool) -> Bool) True False;
and = boolElim (\ (_ :: Bool) -> forall (_ :: Bool) . Bool) (\ (_ :: Bool) -> False) (id Bool);

or  = boolElim (\ (_ :: Bool) -> forall (_ :: Bool) . Bool) (id Bool) (\ (_ :: Bool) -> True);
xor = boolElim (\ (_ :: Bool) -> forall (_ :: Bool) . Bool) (id Bool) not;
if  = boolElim (\ (_ :: Bool) -> forall (_ :: Bool) . Bool) not (id Bool);

fin1_id =
    \ (e :: Fin_1) ->
        elim Fin_1
            (\ (_ :: Fin_1) -> Fin_1)
            finElem_1_1
            e;

fin2_id =
    \ (e :: Fin_2) ->
        elim Fin_2
            (\ (_ :: Fin_2) -> Fin_2)
            finElem_1_2
            finElem_2_2
            e;
