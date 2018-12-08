(*
    Tests for 236319 2019A HW3 Q1
    All boolean tests should return true
    Each question contains tests which check warnings and errors
*)

(* Testing function: at *)

val _ = print("\nTesting function: at\n");

val test1 = (([1] at 0) = 1);
val test2 = (([1,2] at 1) = 2);
val test3 = (([1,2,3] at 2) = 3);
val test4 = (([1,2,3,4] at 3) = 4);
val test5 = (([1,2,3,4] at 2) = 3);
val test6 = (([1,2,3,4] at 1) = 2);
val test7 = (([1,2,3,4] at 0) = 1);

val test8 = (([true] at 0) = true);
val test9 = (([true,false] at 1) = false);
val test10 = (([true,false,true] at 1) = false);

val test11 = (([#"s",#"a",#"f",#"o",#"t"] at 0) = #"s");
val test12 = (([#"s",#"a",#"f",#"o",#"t"] at 1) = #"a");
val test13 = (([#"s",#"a",#"f",#"o",#"t"] at 2) = #"f");
val test14 = (([#"s",#"a",#"f",#"o",#"t"] at 3) = #"o");
val test15 = (([#"s",#"a",#"f",#"o",#"t"] at 4) = #"t");

val test16 = (([#"2",#"3",#"6",#"3",#"1",#"9"] at 0) = #"2");
val test17 = (([#"2",#"3",#"6",#"3",#"1",#"9"] at 1) = #"3");
val test18 = (([#"2",#"3",#"6",#"3",#"1",#"9"] at 2) = #"6");
val test19 = (([#"2",#"3",#"6",#"3",#"1",#"9"] at 3) = #"3");
val test20 = (([#"2",#"3",#"6",#"3",#"1",#"9"] at 4) = #"1");
val test21 = (([#"2",#"3",#"6",#"3",#"1",#"9"] at 5) = #"9");

val test22 = ((["programming","languages","safot","236319"] at 0) = "programming");
val test23 = ((["programming","languages","safot","236319"] at 1) = "languages");
val test24 = ((["programming","languages","safot","236319"] at 2) = "safot");
val test25 = ((["programming","languages","safot","236319"] at 3) = "236319");

val test26 = (([[1,2],[3,4],[5,6]] at 0) = [1,2]);
val test27 = (([[1,2],[3,4],[5,6]] at 1) = [3,4]);
val test28 = (([[1,2],[3,4],[5,6]] at 2) = [5,6]);

val test29 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 0) at 0) = "s");
val test30 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 0) at 1) = "a");
val test31 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 0) at 2) = "f");
val test32 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 0) at 3) = "o");
val test33 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 0) at 4) = "t");
val test34 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 1) at 0) = "2");
val test35 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 1) at 1) = "3");
val test36 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 1) at 2) = "6");
val test37 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 1) at 3) = "3");
val test38 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 1) at 4) = "1");
val test39 = ((([["s","a","f","o","t"],["2","3","6","3","1","9"]] at 1) at 5) = "9");

(* 
    Warnings for function: at

    val test = (([] at 0) = []);

    Errors for function: at

    val test1 = (([1,2,3,4] at ~1) = 4);
    val test2 = (([1,2,3,4] at 5) = 4);
*)

(* Testing function: enumerate *)

val _ = print("\nTesting function: enumerate\n");

val test1 = ((enumerate [1]) = [(0,1)]);
val test2 = ((enumerate [1,2]) = [(0,1),(1,2)]);
val test3 = ((enumerate [1,2,3]) = [(0,1),(1,2),(2,3)]);
val test4 = ((enumerate [1,2,3,4]) = [(0,1),(1,2),(2,3),(3,4)]);
val test5 = ((enumerate [1,2,3,4,3]) = [(0,1),(1,2),(2,3),(3,4),(4,3)]);
val test6 = ((enumerate [1,2,3,4,3,2]) = [(0,1),(1,2),(2,3),(3,4),(4,3),(5,2)]);
val test7 = ((enumerate [1,2,3,4,3,2,1]) = [(0,1),(1,2),(2,3),(3,4),(4,3),(5,2),(6,1)]);

val test8 = ((enumerate [true]) = [(0,true)]);
val test9 = ((enumerate [true,false]) = [(0,true),(1,false)]);
val test10 = ((enumerate [true,false,true]) = [(0,true),(1,false),(2,true)]);

val test11 = ((enumerate [#"s",#"a",#"f",#"o",#"t"]) = [(0,#"s"),(1,#"a"),(2,#"f"),(3,#"o"),(4,#"t")]);
val test12 = ((enumerate [#"2",#"3",#"6",#"3",#"1",#"9"]) = [(0,#"2"),(1,#"3"),(2,#"6"),(3,#"3"),(4,#"1"),(5,#"9")]);

val test13 = ((enumerate ["PL","safot","236319"]) = [(0,"PL"),(1,"safot"),(2,"236319")]);
val test14 = ((enumerate ["Winter","2019","HW3"]) = [(0,"Winter"),(1,"2019"),(2,"HW3")]);

val test15 = (((enumerate [0,1,2,3]) at 0) = (0,0));
val test16 = (((enumerate [0,1,2,3]) at 1) = (1,1));
val test17 = (((enumerate [0,1,2,3]) at 2) = (2,2));
val test18 = (((enumerate [0,1,2,3]) at 3) = (3,3));

val test19 = (((enumerate [#"s",#"a",#"f",#"o",#"t"]) at 0) = (0,#"s"));
val test20 = (((enumerate [#"s",#"a",#"f",#"o",#"t"]) at 1) = (1,#"a"));
val test21 = (((enumerate [#"s",#"a",#"f",#"o",#"t"]) at 2) = (2,#"f"));
val test22 = (((enumerate [#"s",#"a",#"f",#"o",#"t"]) at 3) = (3,#"o"));
val test23 = (((enumerate [#"s",#"a",#"f",#"o",#"t"]) at 4) = (4,#"t"));

(* 
    Warnings for function: enumerate

    val test = ((enumerate []) = []);
*)

(* Testing function: reverse *)

val _ = print("\nTesting function: reverse\n");

val test1 = ((reverse [1]) = [1]);
val test2 = ((reverse [1,2]) = [2,1]);
val test3 = ((reverse [1,2,3]) = [3,2,1]);
val test4 = ((reverse [1,2,3,4]) = [4,3,2,1]);

val test5 = ((reverse [true]) = [true]);
val test6 = ((reverse [true,false]) = [false,true]);
val test7 = ((reverse [false,true,true,false,false]) = [false,false,true,true,false]);

val test8 = ((reverse [#"s",#"a",#"f",#"o",#"t"]) = [#"t",#"o",#"f",#"a",#"s"]);
val test9 = ((reverse [#"2",#"3",#"4",#"3",#"1",#"9"]) = [#"9",#"1",#"3",#"4",#"3",#"2"]);

val test10 = ((reverse ["PL","safot","236319"]) = ["236319","safot","PL"]);
val test11 = ((reverse ["Winter","2019","HW3"]) = ["HW3","2019","Winter"]);
val test12 = ((reverse [["P","L"],["2","0","1","9"],["W","I","N","T","E","R"]]) = [["W","I","N","T","E","R"],["2","0","1","9"],["P","L"]]);

val test13 = ((enumerate (reverse [1])) = [(0,1)]);
val test14 = ((enumerate (reverse [1,2])) = [(0,2),(1,1)]);
val test15 = ((enumerate (reverse [1,2,3])) = [(0,3),(1,2),(2,1)]);
val test16 = ((enumerate (reverse [1,2,3,4])) = [(0,4),(1,3),(2,2),(3,1)]);

val test17 = ((reverse (enumerate [1])) = [(0,1)]);
val test18 = ((reverse (enumerate [1,2])) = [(1,2),(0,1)]);
val test19 = ((reverse (enumerate [1,2,3])) = [(2,3),(1,2),(0,1)]);
val test20 = ((reverse (enumerate [1,2,3,4])) = [(3,4),(2,3),(1,2),(0,1)]);

val test21 = (((enumerate (reverse ["s","a","f","o","t"])) at 0) = (0,"t"));
val test22 = (((enumerate (reverse ["s","a","f","o","t"])) at 1) = (1,"o"));
val test23 = (((enumerate (reverse ["s","a","f","o","t"])) at 2) = (2,"f"));
val test24 = (((enumerate (reverse ["s","a","f","o","t"])) at 3) = (3,"a"));
val test25 = (((enumerate (reverse ["s","a","f","o","t"])) at 4) = (4,"s"));

val test26 = (((reverse (enumerate ["s","a","f","o","t"])) at 0) = (4,"t"));
val test27 = (((reverse (enumerate ["s","a","f","o","t"])) at 1) = (3,"o"));
val test28 = (((reverse (enumerate ["s","a","f","o","t"])) at 2) = (2,"f"));
val test29 = (((reverse (enumerate ["s","a","f","o","t"])) at 3) = (1,"a"));
val test30 = (((reverse (enumerate ["s","a","f","o","t"])) at 4) = (0,"s"));

(* 
    Warnings for function: reverse

    val test = ((reverse []) = []);
*)

(* Testing function: flatten *)

val _ = print("\nTesting function: flatten\n");

val test1 = ((flatten [[1]]) = [1]);
val test2 = ((flatten [[1],[2]]) = [1,2]);
val test3 = ((flatten [[1],[2],[3]]) = [1,2,3]);
val test4 = ((flatten [[1],[2],[3],[4]]) = [1,2,3,4]);
val test5 = ((flatten [[1,2,3],[4,5,6],[7,8]]) = [1,2,3,4,5,6,7,8]);

val test6 = ((flatten [[], [1]]) = [1]);
val test7 = ((flatten [[], [1],[],[2]]) = [1,2]);
val test8 = ((flatten [[], [1],[],[2],[3],[]]) = [1,2,3]);

val test9 = ((flatten [[[1]]]) = [[1]]);
val test10 = ((flatten [[[1],[2]]]) = [[1],[2]]);
val test11 = ((flatten [[[1],[2],[1]]]) = [[1],[2],[1]]);
val test12 = ((flatten [[[1],[2],[1],[2]]]) = [[1],[2],[1],[2]]);

val test13 = ((flatten [[true]]) = [true]);
val test14 = ((flatten [[true,false]]) = [true,false]);
val test15 = ((flatten [[false,true,true],[false,false]]) = [false,true,true,false,false]);

val test16 = ((flatten [[#"s",#"a"],[#"f",#"o"],[#"t"]]) = [#"s",#"a",#"f",#"o",#"t"]);
val test17 = ((flatten [[#"2"],[#"3"],[#"4"],[#"3"],[#"1"],[#"9"]]) = [#"2",#"3",#"4",#"3",#"1",#"9"]);

val test18 = ((flatten [["236319"]]) = ["236319"]);
val test19 = ((flatten [["PL"],["safot"],["236319"]]) = ["PL","safot","236319"]);
val test20 = ((flatten [["Winter","2019","HW3"]]) = ["Winter","2019","HW3"]);

val test21 = ((enumerate (flatten [[1]])) = [(0,1)]);
val test22 = ((enumerate (flatten [[1],[2]])) = [(0,1),(1,2)]);
val test23 = ((enumerate (flatten [[1],[2],[3,4]])) = [(0,1),(1,2),(2,3),(3,4)]);

val test24 = ((reverse (flatten [[#"s",#"a"],[#"f",#"o"],[#"t"]])) = [#"t",#"o",#"f",#"a",#"s"]);
val test25 = ((reverse (flatten [[#"9",#"1"],[#"3",#"4"],[#"3"],[#"2"]])) = [#"2",#"3",#"4",#"3",#"1",#"9"]);

val test26 = (((enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) at 0) = (0,9));
val test27 = (((enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) at 1) = (1,1));
val test28 = (((enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) at 2) = (2,3));
val test29 = (((enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) at 3) = (3,4));
val test30 = (((enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) at 4) = (4,3));
val test31 = (((enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) at 5) = (5,2));

(* 
    Warnings for function: flatten

    val test = ((flatten []) = []);
*)

(* Testing function: applyif *)

val _ = print("\nTesting function: applyif\n");

val test1 = ((applyif (fn x => x*x) (fn x => x > 5) [1]) = [1]);
val test2 = ((applyif (fn x => x*x) (fn x => x > 5) [1,5]) = [1,5]);
val test3 = ((applyif (fn x => x*x) (fn x => x > 5) [1,5,6]) = [1,5,36]);
val test4 = ((applyif (fn x => x*x) (fn x => x > 5) [1,5,6,13]) = [1,5,36,169]);
val test5 = ((applyif (fn x => x*x) (fn x => x > 5) [1,3,5,7,9,11]) = [1,3,5,49,81,121]);
val test6 = ((applyif (fn x => x div x) (fn x => x <> 0) [1,10,100,500,10000]) = [1,1,1,1,1]);
val test7 = ((applyif (fn x => x div x) (fn x => x <> 0) [1,0,100,500,0]) = [1,0,1,1,0]);
val test8 = ((applyif (fn x => x div x) (fn x => (x <> 0) andalso (x <> 500)) [1,0,100,500,0]) = [1,0,1,500,0]);
val test9 = ((applyif (fn x => x div x) (fn x => x mod 2 = 0) [1,2,3,4,5,6]) = [1,1,3,1,5,1]);
val test10 = ((applyif (fn x => x + 2) (fn x => x mod 3 = 1) [1,2,3,4,5,6]) = [3,2,3,6,5,6]);
val test11 = ((applyif (fn x => x + 10) (fn x => abs(x) > 5) [~7,~5,~1,0,1,5,7]) = [3,~5,~1,0,1,5,17]);

val test12 = ((applyif (fn x => false) (fn x => x) [true]) = [false]);
val test13 = ((applyif (fn x => false) (fn x => x) [true,false,true]) = [false,false,false]);
val test14 = ((applyif (fn x => false) (fn x => not x) [true,false,true]) = [true,false,true]);

val test15 = ((applyif (fn x => Char.toLower(x)) (fn x => Char.isUpper(x)) [#"S",#"a",#"F",#"o",#"T"]) = [#"s",#"a",#"f",#"o",#"t"]);
val test16 = ((applyif (fn x => Char.toLower(x)) (fn x => not (Char.isDigit(x))) [#"P",#"L",#"1",#"9"]) = [#"p",#"l",#"1",#"9"]);

val test17 = ((applyif (fn x => "X") (fn x => String.isSubstring "234" x) ["234319","236319"]) = ["X","236319"]);
val test18 = ((applyif (fn x => "X") (fn x => not (x ^ "319" = "236319")) ["236","234"]) = ["236","X"]);

val test19 = ((applyif (fn x => ["Palindrome"]) (fn x => x = (reverse x)) [["d","o","g"]]) = [["d","o","g"]]);
val test20 = ((applyif (fn x => ["Palindrome"]) (fn x => x = (reverse x)) [["w","o","w"]]) = [["Palindrome"]]);
val test21 = ((applyif (fn x => ["Palindrome"]) (fn x => x = (reverse x)) [["l","e","v","e","l"]]) = [["Palindrome"]]);
val test22 = ((applyif (fn x => ["Palindrome"]) (fn x => x = (reverse x)) [["w","o","w"],["e","g","g"]]) = [["Palindrome"],["e","g","g"]]);

(* Testing function: slice *)

val _ = print("\nTesting function: slice\n");

val test1 = ((slice [1] (0,1)) = [1]);
val test2 = ((slice [1,2,3,4] (0,1)) = [1]);
val test3 = ((slice [1,2,3,4] (0,2)) = [1,2]);
val test4 = ((slice [1,2,3,4] (0,3)) = [1,2,3]);
val test5 = ((slice [1,2,3,4] (0,4)) = [1,2,3,4]);
val test6 = ((slice [1,2,3,4] (1,2)) = [2]);
val test7 = ((slice [1,2,3,4] (1,3)) = [2,3]);
val test8 = ((slice [1,2,3,4] (1,4)) = [2,3,4]);
val test9 = ((slice [1,2,3,4] (2,3)) = [3]);
val test10 = ((slice [1,2,3,4] (2,4)) = [3,4]);
val test11 = ((slice [1,2,3,4] (3,4)) = [4]);
val test12 = ((slice [14,7,3,1,6,1] (2,4)) = [3,1]);

val test13 = ((slice [[],[1]] (0,1)) = [[]]);
val test14 = ((slice [[],[1],[],[2]] (1,3)) = [[1],[]]);
val test15 = ((slice [[],[1],[],[2],[3],[]] (2,5)) = [[],[2],[3]]);

val test16 = ((slice [[false,true,true],[false,false]] (0,1)) = [[false,true,true]]);
val test17 = ((slice [[false,true,true],[false,false]] (0,2)) = [[false,true,true],[false,false]]);

val test18 = ((slice [[#"2"],[#"3"],[#"4"],[#"3"],[#"1"],[#"9"]] (0,1)) = [[#"2"]]);
val test19 = ((slice [[#"2"],[#"3"],[#"4"],[#"3"],[#"1"],[#"9"]] (1,2)) = [[#"3"]]);
val test20 = ((slice [[#"2"],[#"3"],[#"4"],[#"3"],[#"1"],[#"9"]] (2,3)) = [[#"4"]]);
val test21 = ((slice [[#"2"],[#"3"],[#"4"],[#"3"],[#"1"],[#"9"]] (3,4)) = [[#"3"]]);
val test22 = ((slice [[#"2"],[#"3"],[#"4"],[#"3"],[#"1"],[#"9"]] (4,5)) = [[#"1"]]);
val test23 = ((slice [[#"2"],[#"3"],[#"4"],[#"3"],[#"1"],[#"9"]] (5,6)) = [[#"9"]]);

val test24 = ((slice [["PL"],["safot"],["236319"]] (1,2)) = [["safot"]]);
val test25 = ((slice ["Winter","2019","HW3"] (0,2)) = ["Winter","2019"]);
val test26 = ((slice ["Winter","2019","HW3"] (1,3)) = ["2019","HW3"]);

val test27 = ((slice ((enumerate (flatten [[1]]))) (0,1)) = [(0,1)]);
val test28 = ((slice ((enumerate (flatten [[1],[2]]))) (0,2)) = [(0,1),(1,2)]);
val test29 = ((slice ((enumerate (flatten [[1],[2],[2,3]]))) (0,3)) = [(0,1),(1,2),(2,2)]);

val test30 = (((slice (enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) (0,4)) at 0) = (0,9));
val test31 = (((slice (enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) (0,4)) at 1) = (1,1));
val test32 = (((slice (enumerate (reverse (flatten [[2],[3,4],[3,1,9]]))) (0,4)) at 2) = (2,3));

(* 
    Warnings for function: slice

    val test = ((slice [] (0,0)) = []);
    
    Errors for function: slice
    
    val test1 = (slice [1] (2,6) = []);
    val test2 = (slice [5,6] (1,0) = []);
    val test3 = (slice [5,6] (0,~1) = []);
    val test4 = (slice [5,6] (~1,~1) = []);
*)

(* Testing function: allholds *)

val _ = print("\nTesting function: allholds\n");

val test1 = ((allholds [] [1]) = [1]);
val test2 = ((allholds [] [1,2,3]) = [1,2,3]);
val test3 = ((allholds [fn x => x mod 3 = 0] [2,4,5]) = []);
val test4 = ((allholds [fn x => x mod 3 = 0] [3,6,8]) = [3,6]);
val test5 = ((allholds [fn x => x mod 2 = 0] [1,2,3]) = [2]);
val test6 = ((allholds [fn x => x mod 2 = 0] [2,1,2]) = [2,2]);
val test7 = ((allholds [fn x => x mod 2 = 0] [2,4,6]) = [2,4,6]);
val test8 = ((allholds [fn x => x < 0, fn y => y > 0] [~6,~4,~3,0,3,4,6]) = []);
val test9 = ((allholds [fn x => x <= 0, fn y => y >= 0] [~6,~4,~3,0,3,4,6]) = [0]);
val test10 = ((allholds [fn x => x < 0, fn y => y mod 2 = 0] [~6,~4,~3,3,4,6]) = [~6,~4]);
val test11 = ((allholds [fn x => x mod 2 = 0, fn y => y mod 3 = 0] [1,3,6,8,12,18,9]) = [6,12,18]);
val test12 = ((allholds [fn x => x mod 2 = 0, fn y => y mod 3 = 0] [6,12,24,36,48]) = [6,12,24,36,48]);

val test13 = ((allholds [fn x => (substring (x,0,3)) = "234"] ["104031","104172"]) = []);
val test14 = ((allholds [fn x => (substring (x,0,3)) = "234"] ["234319","104167","234114","104031"]) = ["234319","234114"]);
val test15 = ((allholds [fn x => (substring (x,0,3)) = "234"] ["234124","104031","104172","234141"]) = ["234124","234141"]);
val test16 = ((allholds [fn x => "236" ^ x = "236319"] ["3190","318","319","320"]) = ["319"]);
val test17 = ((allholds [fn x => size(x) = 6] ["safot","236319","Winter","2019","HW3"]) = ["236319","Winter"]);

val test18 = ((allholds [fn x => x] [true,true,false]) = [true,true]);
val test19 = ((allholds [fn x => not x] [true,true,false]) = [false]);

val test20 = ((allholds [fn x => ord(x) > ord(#"5")] [#"2",#"3",#"4",#"3",#"1",#"9"]) = [#"9"]);
val test21 = ((allholds [fn x => ord(x) > ord(#"3")] [#"2",#"3",#"4",#"3",#"1",#"9"]) = [#"4",#"9"]);
val test22 = ((allholds [fn x => ord(x) >= ord(#"A"),fn x => ord(x) <= ord(#"Z")] [#"S",#"a",#"F",#"o",#"T"]) = [#"S",#"F",#"T"]);
val test23 = ((allholds [fn x => ord(x) >= ord(#"a"),fn x => ord(x) <= ord(#"z")] [#"S",#"a",#"F",#"o",#"T"]) = [#"a",#"o"]);

val test24 = ((allholds [fn x => hd(x) = "PL"] [["PL"],["safot"],["236319"]]) = [["PL"]]);
val test25 = ((allholds [fn x => List.all (fn y => y mod 2 = 0) x] [[2,3,4],[2,5,6],[2,6,7]]) = []);
val test26 = ((allholds [fn x => List.all (fn y => y mod 2 = 0) x] [[2,3,4],[2,4,6],[2,6,7]]) = [[2,4,6]]);
val test27 = ((allholds [fn x => List.all (fn y => y mod 3 = 0) x] [[6,6,6],[2,4,6],[2,6,7]]) = [[6,6,6]]);
val test28 = ((allholds [fn x => List.exists (fn y => y mod 3 = 0) x] [[6,6,6],[2,4,6],[2,5,7]]) = [[6,6,6],[2,4,6]]);
val test29 = ((allholds [fn x => List.exists (fn y => y mod 5 = 0) x] [[6,6,6],[2,4,6],[2,5,7]]) = [[2,5,7]]);
