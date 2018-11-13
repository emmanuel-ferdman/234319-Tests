(*
    Tests for 234319 2019A HW2 - Q1 (basic tests)
    All boolean tests should return true
*)

(* Testing function: assertThat *)

val _ = print("\nTesting function: assertThat\n");

val test1 = (assertThat 5 (fn a => fn b => a = b) 5);
val test2 = (assertThat 555 (fn a => fn b => ~a = ~b) 555);
val test3 = (assertThat 234319 (fn a => fn b => a - b = 0) 234319);
val test4 = (assertThat 234319 (fn a => fn b => a = ~b) ~234319);

val test5 = (assertThat (5,0) (fn (a,b) => fn (c,d) => a = c) (5,100));
val test6 = (assertThat (5,4) (fn (a,b) => fn (c,d) => (a,b) = (c,d)) (5,4));
val test7 = (assertThat (7,8) (fn (a,b) => fn (c,d) => (a,b) = (~c,~d)) (~7,~8));

val test8 = (assertThat #"1" (fn a => fn b => a = b) #"1");
val test9 = (assertThat #"5" (fn a => fn b => ord(a) - ord(b) = 0) #"5");

val test10 = (assertThat "234319" (fn a => fn b => a = b) "234319");
val test11 = (assertThat "234" (fn a => fn b => (b ^ a = "234319")) "319");
val test12 = (assertThat "12345" (fn a => fn b => size(a) = size(b)) "54321");

val test13 = (assertThat [23,43,19] (fn a => fn b => a = b) [23,43,19]);
val test14 = (assertThat [23,43,19] (fn a => fn b => hd(a) = hd(b)) [23,42,18]);
val test15 = (assertThat [43,43,19] (fn a => fn b => tl(a) = tl(b)) [23,43,19]);
val test16 = (assertThat [2,3,4,3,1,9] (fn a => fn b => rev(a) = b) [9,1,3,4,3,2]);
val test17 = (assertThat [2,3,4] (fn a => fn b => b @ a = [2,3,4,3,1,9]) [3,1,9]);

val test18 = ((assertThat 5 (fn a => fn b => a = b) 6) = false);
val test19 = ((assertThat 5 (fn a => fn b => a < b) 5) = false);
val test20 = ((assertThat (7,8) (fn (a,b) => fn (c,d) => (a,b) = (~c,~d)) (~7,8)) = false);
val test21 = ((assertThat "234" (fn a => fn b => (a ^ b = "234319")) "319") = false);
val test22 = ((assertThat [2,3,4] (fn a => fn b => a @ b = [2,3,4,3,1,9]) [3,1,9]) = false);

(* Testing function: equalTo *)

val _ = print("\nTesting function: equalTo\n");

val test1 = (assertThat 0 equalTo 0);
val test2 = (assertThat ~5 equalTo ~5);
val test3 = (assertThat 234319 equalTo 234319);

val test4 = (assertThat true equalTo true);
val test5 = (assertThat false equalTo false);

val test6 = (assertThat #"x" equalTo #"x");
val test7 = (assertThat #"5" equalTo #"5");
val test8 = (assertThat #"\t" equalTo #"\t");

val test9 = (assertThat "a" equalTo "a");
val test10 = (assertThat "safot" equalTo "safot");
val test11 = (assertThat "234319" equalTo "234319");

val test12 = (assertThat (5,4) equalTo (5,4));
val test13 = (assertThat (23,43,19) equalTo (23,43,19));
val test14 = (assertThat ("a",5,(#"x")) equalTo ("a",5,(#"x")));

val test15 = (assertThat [] equalTo []);
val test16 = (assertThat [23,43,19] equalTo [23,43,19]);
val test17 = (assertThat ["sa","fo","t"] equalTo ["sa","fo","t"]);

val test18 = (assertThat true equalTo (assertThat 5 equalTo 5));
val test19 = (assertThat false equalTo (assertThat "4" equalTo "5"));
val test20 = (assertThat false equalTo (assertThat #"x" equalTo #"5"));

val test21 = (assertThat 5 equalTo 6) = false;
val test22 = (assertThat "a" equalTo "b") = false;
val test23 = (assertThat "A" equalTo "a") = false;
val test24 = (assertThat true equalTo false) = false;
val test25 = (assertThat #"a" equalTo #"b") = false;
val test26 = (assertThat ("a",5,(#"x")) equalTo ("b",5,(#"x"))) = false;

(* Testing function: doesnt *)

val _ = print("\nTesting function: doesnt\n");

val test1 = (assertThat 5 doesnt (equalTo 6));
val test2 = (assertThat ~5 doesnt (equalTo 5));
val test3 = (assertThat 234319 doesnt (equalTo ~234319));

val test4 = (assertThat true doesnt (equalTo false));
val test5 = (assertThat false doesnt (equalTo true));

val test6 = (assertThat #"5" doesnt (equalTo #"6"));
val test7 = (assertThat #"x" doesnt (equalTo #"X"));
val test8 = (assertThat  #"\t" doesnt (equalTo  #"\n"));

val test9 = (assertThat "5" doesnt (equalTo "6"));
val test10 = (assertThat "A" doesnt (equalTo "a"));
val test11 = (assertThat "safot" doesnt (equalTo "Safot"));

val test13 = (assertThat (5,4) doesnt (equalTo (4,5)));
val test14 = (assertThat (23,43,19) doesnt (equalTo (19,43,23)));
val test15 = (assertThat (~23,43,19) doesnt (equalTo (23,43,19)));
val test16 = (assertThat ("A",5,(#"x")) doesnt (equalTo ("a",5,(#"x"))));

val test17 = (assertThat [] doesnt (equalTo [5]));
val test18 = (assertThat [23,43,19] doesnt (equalTo [~23,43,19]));
val test19 = (assertThat ["sa","fo","t"] doesnt (equalTo ["sa","fo","T"]));

val test20 = (assertThat true doesnt (equalTo (assertThat 5 equalTo 6)));
val test21 = (assertThat false doesnt (equalTo (assertThat #"X" doesnt (equalTo #"x"))));
val test22 = (assertThat (assertThat (5,4) doesnt (equalTo (4,5))) equalTo (assertThat 5 doesnt (equalTo 6)));
val test23 = (assertThat (assertThat ["sa","fo","t"] equalTo ["sa","fo","t"]) doesnt (equalTo (assertThat #"7" doesnt (equalTo #"7"))));

(* Testing function: bothOf *)

val _ = print("\nTesting function: bothOf\n");

val test1 = (assertThat 5 bothOf (doesnt (equalTo 6), equalTo 5));
val test2 = (assertThat 234319 bothOf (doesnt (equalTo ~234319), equalTo 234319));
val test3 = (assertThat 234319 bothOf (doesnt (equalTo ~234319), equalTo (234 * 1000 + 319)));

val test4 = (assertThat true bothOf (equalTo true, equalTo true));
val test5 = (assertThat true bothOf (doesnt (equalTo false), equalTo true));

val test6 = (assertThat #"0" bothOf (equalTo #"0", doesnt (equalTo #"1")));
val test7 = (assertThat #"0" bothOf (doesnt (equalTo #"a"), doesnt (equalTo #"1")));
val test8 = (assertThat #"A" bothOf (doesnt (equalTo #"B"), doesnt (equalTo #"a")));

val test9 = (assertThat "safot" bothOf (equalTo ("sa" ^ "fot"), equalTo ("saf" ^ "ot")));
val test10 = (assertThat "234319" bothOf (equalTo ("234" ^ "319"), equalTo ("2" ^ "3" ^ "4" ^ "3" ^ "1" ^ "9")));
val test11 = (assertThat (size("safot")) bothOf (doesnt (equalTo (size("234319"))), equalTo (size("tofsa"))));

val test12 = (assertThat (2,3,4,3,1,9) bothOf (equalTo (2,3,4,3,1,9), doesnt (equalTo (~2,3,4,3,1,9))));
val test13 = (assertThat ("A",5,(#"x")) bothOf (doesnt (equalTo ("A",5,(#"X"))), doesnt (equalTo ("a",5,(#"x")))));

val test14 = (assertThat [] bothOf (equalTo [], doesnt (equalTo [1])));
val test15 = (assertThat ["s","a","f","o","t"] bothOf (doesnt (equalTo ["t"]), equalTo (rev(["t","o","f","a","s"]))));
val test16 = (assertThat [2,3,4,3,1,9] bothOf (equalTo ([2,3,4] @ [3,1,9]), equalTo (rev([9,1,3,4,3,2]))));
