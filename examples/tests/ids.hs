import "examples/core.hs";
import "examples/dproduct.hs";
import "examples/eq.hs";
import "examples/fin.hs";
import "examples/list.hs";
import "examples/nat.hs";
import "examples/product.hs";
import "examples/sum.hs";

$A :: Set;
$B :: Set;
$F :: forall (_ :: $A) . Set;
$dp :: exists (x :: $A) . $F x;
$x :: $A; $y :: $A; $eq_x_y :: Eq $A $x $y;
$f1 :: Fin_1; $f2 :: Fin_2;
$xs :: List $A;
$n :: Nat;
$p :: Product $A $B;
$s :: Sum $A $B;

(_, _) =
    sc (list_id $A $xs);

(_, _) =
    sc (dproduct_id $A $F $dp);

(_, _) =
    sc (eq_id $A $x $y $eq_x_y);

(_, _) =
    sc (Refl $A $x);

(_, _) =
    sc (fin1_id $f1);

(_, _) =
    sc (fin2_id $f2);

(_, _) =
    sc (list_id $A $xs);

(_, _) =
    sc (nat_id $n);

(x1, x2) = sc (product_id $A $B $p);

(_, _) =
    sc (sum_id $A $B $s);