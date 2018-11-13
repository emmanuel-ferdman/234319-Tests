(*
    Tests for 234319 2019A HW2 - Q2
    All boolean tests should return true
*)

(* Testing function: prefixSum *)

val _ = print("\nTesting function: prefixSum\n");

val test1 = prefixSum "" = [];
val test2 = prefixSum "a" = [1];
val test3 = prefixSum "A" = [1];
val test4 = prefixSum "az" = [1,27];
val test5 = prefixSum "Az" = [1,27];
val test6 = prefixSum "aMz" = [1,14,40];
val test7 = prefixSum "AMZ" = [1,14,40];

val test8 = prefixSum "tomer" = [20,35,48,53,71];
val test9 = prefixSum "Tomer" = [20,35,48,53,71];
val test10 = prefixSum "tOmEr" = [20,35,48,53,71];
val test11 = prefixSum "safot" = [19,20,26,41,61];
val test12 = prefixSum "SaFoT" = [19,20,26,41,61];
val test13 = prefixSum "sAfOt" = [19,20,26,41,61];
val test14 = prefixSum "SAFOT" = [19,20,26,41,61];

val test15 = prefixSum "Programming" = [16,34,49,56,74,75,88,101,110,124,131];
val test16 = prefixSum "Languages" = [12,13,27,34,55,56,63,68,87];
val test17 = prefixSum "Winter" = [23,32,46,66,71,89];
val test18 = prefixSum "WiNtEr" = [23,32,46,66,71,89];
val test19 = prefixSum "winteR" = [23,32,46,66,71,89];

val test19 = prefixSum "abcdefghijkl" = [1,3,6,10,15,21,28,36,45,55,66,78];
val test20 = prefixSum "mnopqrstu" = [13,27,42,58,75,93,112,132,153];
val test21 = prefixSum "vwxyz" = [22,45,69,94,120];
