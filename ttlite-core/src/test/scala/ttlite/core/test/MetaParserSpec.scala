package ttlite.core.test

import ttlite.core._

class MetaParserSpec extends org.scalatest.FunSpec {

  describe("MetaParser") {
    it("should parse global variable") {
      assert(MetaParser.parseMTerm("x") === MVar(Global("x")))
    }

    it("should parse assumed variable") {
      assert(MetaParser.parseMTerm("$x") === MVar(Assumed("$x")))
    }

    it("should parse assumed application") {
      assert(MetaParser.parseMTerm("$x $x") === MVar(Assumed("$x")) ~ MVar(Assumed("$x")))
      assert(MetaParser.parseMTerm("$x $x $x") === MVar(Assumed("$x")) ~ MVar(Assumed("$x")) ~ MVar(Assumed("$x")))
    }

    it("should parse binder term") {
      assert(MetaParser.parseMTerm("forall (x : a) . x") ==
        MBind("forall", MVar(Global("a")),MVar(Quote(0))))
      assert(MetaParser.parseMTerm("forall (x : a) (y : x). x") ==
        MBind("forall",MVar(Global("a")),MBind("forall",MVar(Quote(0)),MVar(Quote(1)))))
      assert(MetaParser.parseMTerm("forall (x : a) (y : x). y") ==
        MBind("forall",MVar(Global("a")),MBind("forall",MVar(Quote(0)),MVar(Quote(0)))))
      assert(MetaParser.parseMTerm("forall (x : a) . forall (y : x) . x") ==
        MBind("forall",MVar(Global("a")),MBind("forall",MVar(Quote(0)),MVar(Quote(1)))))
      assert(MetaParser.parseMTerm("forall (x : a) . exists (y : x) . f x") ===
        MBind("forall", MVar(Global("a")), MBind("exists",MVar(Quote(0)), MVar(Global("f")) ~ MVar(Quote(1)))))
    }

  }

}
