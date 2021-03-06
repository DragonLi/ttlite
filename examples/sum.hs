sum_swap : forall (A : Set) (B : Set) (_ : Sum A B) . Sum B A;
sum_swap =
    (\ (A : Set) (B : Set) (s : Sum A B) ->
        elim (Sum A B)
            (\ (_ : Sum A B) -> Sum B A)
            (\ (a : A) . InR (Sum B A) a)
            (\ (b : B) . InL (Sum B A) b)
            s);

sum_id : forall (A : Set) (B : Set) (_ : Sum A B) . Sum A B;
sum_id =
    (\ (A : Set) (B : Set) (s : Sum A B) ->
        elim (Sum A B)
            (\ (_ : Sum A B) -> Sum A B)
            (\ (a : A) . InL (Sum A B) a)
            (\ (b : B) . InR (Sum A B) b)
            s);
