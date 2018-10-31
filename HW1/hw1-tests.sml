(*
    Tests for 234319 2019A HW1
    All boolean tests should return true
*)

(* Testing function: balance *)

val _ = print("\nTesting function: balance\n");

val test1 = (balance "" = true);
val test2 = (balance "()" = true);
val test3 = (balance "[]" = true);
val test4 = (balance "(][)" = true);
val test5 = (balance "(())" = true);
val test6 = (balance "(()((())()))" = true);
val test7 = (balance "if(true) then (foo(5))" = true);

val test8 = (balance ")" = false);
val test9 = (balance ":(" = false);
val test10 = (balance ":((" = false);
val test11 = (balance ")(" = false);
val test12 = (balance "))((" = false);
val test13 = (balance "())(()" = false);
val test14 = (balance "if)true) then (foo(5))" = false);

(* Testing function: atoi *)

val _ = print("\nTesting function: atoi\n");

val test1 = (atoi "0" = 0);
val test2 = (atoi "5" = 5);
val test3 = (atoi "17" = 17);
val test4 = (atoi "33" = 33);
val test5 = (atoi "123" = 123);
val test6 = (atoi "91551" = 91551);
val test7 = (atoi "611657" = 611657);
val test8 = (atoi "56235141" = 56235141);
val test9 = (atoi "123456789" = 123456789);

(* Testing function: reverseString *)

val _ = print("\nTesting function: reverseString\n");

val test1 = (reverseString "" = "");
val test2 = (reverseString "0" = "0");
val test3 = (reverseString "())(()" = ")(())(");
val test4 = (reverseString "safot" = "tofas");
val test5 = (reverseString "234319" = "913432");
val test6 = (reverseString "ABCDCBA" = "ABCDCBA");
val test7 = (reverseString "123456789" = "987654321");
val test8 = (reverseString "hello world" = "dlrow olleh");
val test9 = (reverseString "reverseString" = "gnirtSesrever");

(* Testing function: extended *)

val _ = print("\nTesting function: extended\n");

val test1 = (extended(3,9) = (3,1,0));
val test2 = (extended(~10,6) = (2,1,2));
val test3 = (extended(64,5) = (1,~1,13));
val test4 = (extended(5,64) = (1,13,~1));
val test5 = (extended(65,40) = (5,~3,5));
val test6 = (extended(~1,~1) = (1,0,~1));
val test7 = (extended(~7,80) = (1,~23,~2));
val test8 = (extended(259,70) = (7,3,~11));
val test9 = (extended(259,70) = (7,3,~11));
val test10 = (extended(100,2004) = (4,~20,1));
val test11 = (extended(~555,~11) = (1,2,~101));
val test12 = (extended(2581,2059) = (29,4,~5));
val test13 = (extended(234319,30) = (1,~11,85917));
val test14 = (extended(1432,123211) = (1,~22973,267));
val test15 = (extended(55555555,~51252151) = (1,21231107,23013784));
