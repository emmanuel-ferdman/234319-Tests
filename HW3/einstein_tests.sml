(*
    Tests for 236319 2019A HW3 Q2
    All boolean tests should return true
*)

Control.Print.printDepth := 100;

(* Additional functions *)

val _ = print("\nAdditional functions\n");

fun get_char (Puzzle (cl,f)) = cl;

fun merge cmp ([], ys) = ys
  | merge cmp (xs, []) = xs
  | merge cmp (xs as x::xs', ys as y::ys') =
      case cmp (x, y) of
           GREATER => y :: merge cmp (xs, ys')
         | _       => x :: merge cmp (xs', ys);

fun sort cmp [] = []
  | sort cmp [x] = [x]
  | sort cmp xs =
    let
      val ys = List.take (xs, length xs div 2)
      val zs = List.drop (xs, length xs div 2)
    in
      merge cmp (sort cmp ys, sort cmp zs)
    end;
    
fun compare (((x:string)::xs),(y::ys)) = if x > y then GREATER else LESS
|   compare ((x::xs),[]) = GREATER
|   compare ([], _) = LESS;

fun c_to_list [] = []
|   c_to_list ((Char x)::xs) = x::(c_to_list xs);



(* Testing function: riddle *)

val _ = print("\nTesting function: riddle\n");

val test1 = ((get_char (riddle 0)) = ([]));
val test1 = ((get_char (riddle 1)) = ([Char []]));
val test1 = ((get_char (riddle 2)) = ([Char [],Char []]));
val test1 = ((get_char (riddle 3)) = ([Char [],Char [],Char []]));
val test1 = ((get_char (riddle 4)) = ([Char [],Char [],Char [],Char []]));

(* Testing function: product  *)

val _ = print("\nTesting function: product\n");

val test1 = ((product []) = []);
val test2 = ((product [Char []]) = []);
val test3 = ((product [Char [],Char[]]) = []);
val test4 = (sort compare (product [Char ["A"]]) = sort compare [["A"]]);
val test5 = (sort compare (product [Char ["A"],Char ["B"]]) = sort compare [["A","B"]]);
val test6 = (sort compare (product [Char ["A"],Char ["B"],Char ["C"]]) = sort compare [["A","B","C"]]);
val test7 = (sort compare (product [Char ["A"],Char ["B","C"]]) = sort compare [["A","B"],["A","C"]]);
val test8 = (sort compare (product [Char ["A","B"],Char ["C"]]) = sort compare [["A","C"],["B","C"]]);
val test9 = (sort compare (product [Char ["A","B"],Char ["C","D"]]) = sort compare [["A","C"],["A","D"],["B","C"],["B","D"]]);
val test10 = (sort compare (product [Char ["A"],Char ["B"],Char ["C"],Char ["D"]]) = sort compare [["A","B","C","D"]]);
val test11 = (sort compare (product [Char ["A","B"],Char ["C","D","E"]]) = sort compare [["A","C"],["A","D"],["A","E"],["B","C"],["B","D"],["B","E"]]);
val test12 = (sort compare (product [Char ["A", "B", "C"], Char ["D", "E"]]) = sort compare [["A","D"],["A","E"],["B","D"],["B","E"],["C","D"],["C","E"]]);

(* Testing function: update *)

val _ = print("\nTesting function: update\n");

val _ = print("\n########## TestA - 1 ##########\n");
val it = [Char nil, Char nil];
val test1 = (sort compare (c_to_list (update it (Connection ["green", ""]))) = sort compare (c_to_list [Char ["green"],Char []]));

val _ = print("\n########## TestA - 2 ##########\n");
val it = [Char nil, Char nil];
update it (Connection ["green", ""]);
val test2 = (sort compare (c_to_list (update it (Connection ["red", "cat"]))) = sort compare (c_to_list [Char ["red","green"],Char ["cat"]]));

val _ = print("\n########## TestA - 3 ##########\n");
val it = [Char nil, Char nil];
update it (Connection ["green", ""]);
update it (Connection ["red", "cat"]);
val test3 = (sort compare (c_to_list (update it (Connection ["", "dog"]))) = sort compare (c_to_list  [Char ["red","green"],Char ["dog","cat"]]));

val _ = print("\n########## TestA - 4 ##########\n");
val it = [Char nil, Char nil];
update it (Connection ["green", ""]);
update it (Connection ["red", "cat"]);
update it (Connection ["", "dog"]);
val test4 = (sort compare (c_to_list (update it (Connection ["", "cat"]))) = sort compare (c_to_list  [Char ["red","green"],Char ["dog","cat"]]));

val _ = print("\n########## TestA - 5 ##########\n");
val it = [Char nil, Char nil];
update it (Connection ["green", ""]);
update it (Connection ["red", "cat"]);
update it (Connection ["", "dog"]);
update it (Connection ["", "cat"]);
val test5 = (sort compare (c_to_list (update it (Connection ["red", "wolf"]))) = sort compare (c_to_list  [Char ["red","green"],Char ["wolf","dog","cat"]]));

val _ = print("\n########## TestB - 1 ##########\n");
val it = [Char nil, Char nil, Char nil];
val test1 = (sort compare (c_to_list (update it (Connection ["green", "", "milk"]))) = sort compare (c_to_list  [Char ["green"],Char [],Char ["milk"]]));

val _ = print("\n########## TestB - 2 ##########\n");
val it = [Char nil, Char nil, Char nil];
update it (Connection ["green", "", "milk"]);
val test2 = (sort compare (c_to_list (update it (Connection ["", "dog", "milk"]))) = sort compare (c_to_list  [Char ["green"],Char ["dog"],Char ["milk"]]));

val _ = print("\n########## TestB - 3 ##########\n");
val it = [Char nil, Char nil, Char nil];
update it (Connection ["green", "", "milk"]);
update it (Connection ["", "dog", "milk"]);
val test3 = (sort compare (c_to_list (update it (Connection ["red", "cat", ""]))) = sort compare (c_to_list  [Char ["red","green"],Char ["cat","dog"],Char ["milk"]]));

val _ = print("\n########## TestB - 4 ##########\n");
val it = [Char nil, Char nil, Char nil];
update it (Connection ["green", "", "milk"]);
update it (Connection ["", "dog", "milk"]);
update it (Connection ["red", "cat", ""]);
val test4 = (sort compare (c_to_list (update it (Connection ["blue", "", ""]))) = sort compare (c_to_list [Char ["blue","red","green"], Char ["cat","dog"],Char ["milk"]]));

val _ = print("\n########## TestC - 1 ##########\n");
val it = [Char nil, Char nil, Char nil, Char nil];
val test1 = (sort compare (c_to_list (update it (Connection ["Table","","","Blue"]))) = sort compare (c_to_list [Char ["Table"],Char [],Char [],Char ["Blue"]]));

val _ = print("\n########## TestC - 2 ##########\n");
val it = [Char nil, Char nil, Char nil, Char nil];
update it (Connection ["Table","","","Blue"]);
val test2 = (sort compare (c_to_list (update it (Connection ["","","",""]))) = sort compare (c_to_list [Char ["Table"],Char [],Char [],Char ["Blue"]]));

val _ = print("\n########## TestC - 3 ##########\n");
val it = [Char nil, Char nil, Char nil, Char nil];
update it (Connection ["Table","","","Blue"]);
update it (Connection ["","","",""]);
val test3 = (sort compare (c_to_list (update it (Connection ["","Yossi","","Pink"]))) = sort compare (c_to_list [Char ["Table"],Char ["Yossi"],Char [], Char ["Pink","Blue"]]));

val _ = print("\n########## TestC - 4 ##########\n");
val it = [Char nil, Char nil, Char nil, Char nil];
update it (Connection ["Table","","","Blue"]);
update it (Connection ["","","",""]);
update it (Connection ["","Yossi","","Pink"]);
val test4 = (sort compare (c_to_list (update it (Connection ["","David","25",""]))) = sort compare (c_to_list [Char ["Table"],Char ["David","Yossi"],Char ["25"], Char ["Pink","Blue"]]));

val _ = print("\n########## TestC - 5 ##########\n");
val it = [Char nil, Char nil, Char nil, Char nil];
update it (Connection ["Table","","","Blue"]);
update it (Connection ["","","",""]);
update it (Connection ["","Yossi","","Pink"]);
update it (Connection ["","David","25",""]);
val test5 = (sort compare (c_to_list (update it (Connection ["","","21","Black"]))) = sort compare (c_to_list [Char ["Table"],Char ["David","Yossi"],Char ["21","25"], Char ["Black","Pink","Blue"]]));

val _ = print("\n########## TestC - 6 ##########\n");
val it = [Char nil, Char nil, Char nil, Char nil];
update it (Connection ["Table","","","Blue"]);
update it (Connection ["","","",""]);
update it (Connection ["","Yossi","","Pink"]);
update it (Connection ["","David","25",""]);
update it (Connection ["","","21","Black"]);
val test6 = (sort compare (c_to_list (update it (Connection ["Chair","","","Yellow"]))) = sort compare (c_to_list [Char ["Chair","Table"],Char ["David","Yossi"],Char ["21","25"],Char ["Yellow","Black","Pink","Blue"]]));

val _ = print("\nTesting function: solve\n");

infix ++;
fun solution ++ connection = trueConnection solution connection;
infix +!;
fun solution +! connection = falseConnection solution connection;

val _ = print("\n########## TestA ##########\n");

riddle 2;
it ++ (Connection ["Brit", ""]);
it ++ (Connection ["", "Cat"]);

val test = ((sort compare (solve it)) = (sort compare [["Brit","Cat"]]));

val _ = print("\n########## TestB ##########\n");

riddle 2;
it ++ (Connection ["Brit", "Red"]);
it ++ (Connection ["German", "Yellow"]);

val test = ((sort compare (solve it)) = (sort compare [["German", "Yellow"],["Brit", "Red"]]));

val _ = print("\n########## TestC ##########\n");

riddle 3;
it ++ (Connection ["Brit", "Cat",""]);
it ++ (Connection ["Brit", "","Yellow"]);
it ++ (Connection ["German", "Dog",""]);
it ++ (Connection ["", "","Pink"]);

val test = ((sort compare (solve it)) = (sort compare [["German","Dog","Pink"],["Brit","Cat","Yellow"]]));

val _ = print("\n########## TestC ##########\n");

riddle 3;
it ++ (Connection ["German", "Dog",""]);
it ++ (Connection ["Brit", "","Pink"]);
it ++ (Connection ["", "","Yellow"]);
it ++ (Connection ["German", "","Black"]);
it ++ (Connection ["Dane", "Cat",""]);
it ++ (Connection ["Brit", "Fox",""]);

val test = (sort compare (solve it) = sort compare ([["Dane","Cat","Yellow"],["Brit","Fox","Pink"],["German","Dog","Black"]]));

val _ = print("\n########## TestD ##########\n");

(* Link to the riddle: https://udel.edu/~os/riddle.html *)

riddle 5;
it ++ (Connection ["Brit", "Red", "", "", ""]);
it ++ (Connection ["Swede", "", "Dogs", "", ""]);
it ++ (Connection ["Dane", "", "Horses", "Tea", ""]);
it ++ (Connection ["", "Green", "", "Coffee", ""]);
it ++ (Connection ["", "White", "", "Beer", "BlueMaster"]);
it ++ (Connection ["Norwegian", "", "", "", "Dunhill"]);
it ++ (Connection ["", "", "Birds", "Milk" ,"Pall Mall"]);
it ++ (Connection ["German", "", "", "", "Prince"]);
it ++ (Connection ["", "White", "", "", ""]);
it ++ (Connection ["", "", "Fish", "", ""]);
it +! (Connection ["", "", "Cats", "", "Blend"]);
it +! (Connection ["Norwegian", "Blue", "", "", ""]);
it +! (Connection ["", "Yellow", "Horses", "", ""]);
it +! (Connection ["German", "", "Cats", "", ""]);
it +! (Connection ["", "", "", "Water", "Prince"]);

val test = ((sort compare (solve it)) = (sort compare [["German","Green","Fish","Coffee","Prince"],
   ["Norwegian","Yellow","Cats","Water","Dunhill"],
   ["Dane","Blue","Horses","Tea","Blend"],
   ["Swede","White","Dogs","Beer","BlueMaster"],
   ["Brit","Red","Birds","Milk","Pall Mall"]]));

val _ = print("\n########## TestE ##########\n");

(* Link to the riddle: https://www.brainzilla.com/logic/zebra/basic-1/ *)

riddle 2;
it +! (Connection ["Spanish", "Red"]);
it ++ (Connection ["Norwegian", "Blue"]);
it ++ (Connection ["", "White"]);
it ++ (Connection ["Italian", ""]);
val test = (sort compare (solve it) = sort compare ([["Italian","Red"],["Norwegian","Blue"],["Spanish","White"]]));

val _ = print("\n########## TestF ##########\n");

(* Link to the riddle: https://www.brainzilla.com/logic/zebra/basic-2/ *)

riddle 4;
it ++ (Connection ["", "","Cats","Soccer"]);
it ++ (Connection ["Brazilian", "Blue","",""]);
it ++ (Connection ["", "","Dogs","Basketball"]);
it ++ (Connection ["Australian", "","",""]);
it ++ (Connection ["", "","Fish",""]);
it +! (Connection ["", "Red","Cats",""]);
it +! (Connection ["German", "Green","",""]);
it ++ (Connection ["", "Blue","","Football"]);
val test = (sort compare (solve it) = sort compare ([["German","Red","Dogs","Basketball"],["Australian","Green","Cats","Soccer"],["Brazilian","Blue","Fish","Football"]]));
