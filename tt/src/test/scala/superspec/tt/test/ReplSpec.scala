package superspec.tt.test

import superspec.tt._

class ReplSpec2 extends org.scalatest.FunSpec {

  describe("Core REPL should process `examples/ex01_core.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex01_core.pi"))
  }

  describe("DProduct REPL should process `examples/ex01_product.tt` without errors") {
    TTREPLMain2.main(Array("examples/ex01_product.tt"))
  }

  describe("Nat REPL should process `examples/ex02_nat.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex02_nat.pi"))
  }

  describe("Product REPL should process `examples/ex03_product.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex03_product.pi"))
  }


  describe("Sum REPL should process `examples/ex04_sum.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex04_sum.pi"))
  }


  describe("List REPL should process `examples/ex05_list.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex05_list.pi"))
  }

  describe("Eq REPL should process `examples/ex06_eq.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex06_eq.pi"))
  }


  describe("Vector REPL should process `examples/ex07_vec.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex07_vec.pi"))
  }

  describe("Fin REPL should process `examples/ex09_fin.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex09_fin.pi"))
  }

  describe("All REPL should process `examples/ex10_tt.pi` without errors") {
    TTREPLMain2.main(Array("examples/ex10_tt.pi"))
  }

}

