(*
    Tests for 236319 2019A HW5 Q2
    All boolean tests should return true
*)

(* Remove the following line in case you want to see all the signatures *)

Control.Print.out := {say=fn _=>(), flush=fn()=>()};

(* Additional functions *)

val _ = print("\n~~~ Additional functions ~~~\n");

fun printTestOutput string result =
  if result then print ("### V V V - PASSED - " ^ string ^ " ###\n\n")
  else print ("### X X X - FAILED - " ^ string ^ " ###\n\n");
  
fun CHECK string result = printTestOutput string result;

fun factorial n = if n <= 1 then 1 else factorial (n-1) * n;

fun fibonacci n = if n < 3 then 1 else fibonacci (n-1) + fibonacci (n-2);

fun isPrime 2 = true
|   isPrime n =
let
    fun explore m =
        if m >= n then true
        else n mod m <> 0 andalso explore (m + 2)
in
    n > 2 andalso n mod 2 <> 0 andalso explore 3
end;

fun divisors n =
  let
    fun divisorsStartingAt 1 = [1]
      | divisorsStartingAt x =
        if n mod x = 0 then x::divisorsStartingAt(x-1)
        else divisorsStartingAt(x-1);
  in
    divisorsStartingAt(n div 2)
  end;

fun sum xs = foldl op + 0 xs;
fun isAbundant n = sum(divisors n) > n;
fun isPerfect n = sum (divisors n) = n;

fun from x = Cons(x, fn() => from (x+1));
fun downfrom x = Cons(x, fn() => downfrom (x-1));

fun evenTo x = Cons(x,fn() => if x mod 2 = 0 then evenTo (x+2) else evenTo (x+1));
fun oddFrom x = Cons(x,fn() => if x mod 2 = 0 then oddFrom (x-1) else oddFrom (x-2));

fun isEven x = x mod 2 = 0;


(* Testing function: intbseq *)

val _ = print("\n~~~ Testing function: intbseq - subest 1 ~~~\n");

val x = intbseq 2;
CHECK ("intbseq test 1 subtest 1") ((bHead x) = 2);
val x = bForward x;
CHECK ("intbseq test 1 subtest 2") ((bHead x) = 3);
val x = bForward x;
CHECK ("intbseq test 1 subtest 3") ((bHead x) = 4);
val x = bBack x;
CHECK ("intbseq test 1 subtest 4") ((bHead x) = 3);
val x = bBack x;
CHECK ("intbseq test 1 subtest 5") ((bHead x) = 2);
val x = bBack x;
CHECK ("intbseq test 1 subtest 6") ((bHead x) = 1);
val x = bBack x;
CHECK ("intbseq test 1 subtest 7") ((bHead x) = 0);
val x = bBack x;
CHECK ("intbseq test 1 subtest 8") ((bHead x) = ~1);
val x = bBack x;
CHECK ("intbseq test 1 subtest 9") ((bHead x) = ~2);
val x = bBack x;
CHECK ("intbseq test 1 subtest 10") ((bHead x) = ~3);

val _ = print("\n~~~ Testing function: intbseq - subest 2 ~~~\n");

val x = intbseq 10;
CHECK ("intbseq test 2 subtest 1") ((bHead x) = 10);
val x = bBack x;
CHECK ("intbseq test 2 subtest 2") ((bHead x) = 9);
val x = bBack x;
CHECK ("intbseq test 2 subtest 3") ((bHead x) = 8);
val x = bForward x;
CHECK ("intbseq test 2 subtest 4") ((bHead x) = 9);
val x = bBack x;
CHECK ("intbseq test 2 subtest 5") ((bHead x) = 8);

val _ = print("\n~~~ Testing function: intbseq - subest 3 ~~~\n");

val x = intbseq ~100;
CHECK ("intbseq test 3 subtest 1") ((bHead x) = ~100);
val x = bBack x;
CHECK ("intbseq test 3 subtest 2") ((bHead x) = ~101);
val x = bBack x;
CHECK ("intbseq test 3 subtest 3") ((bHead x) = ~102);
val x = bBack x;
CHECK ("intbseq test 3 subtest 4") ((bHead x) = ~103);
val x = bForward x;
CHECK ("intbseq test 3 subtest 5") ((bHead x) = ~102);
val x = bForward x;
CHECK ("intbseq test 3 subtest 6") ((bHead x) = ~101);
val x = bForward x;
CHECK ("intbseq test 3 subtest 7") ((bHead x) = ~100);
val x = bForward x;
CHECK ("intbseq test 3 subtest 8") ((bHead x) = ~99);

(* Testing function: bmap *)

val _ = print("\n~~~ Testing function: bmap - subest 1 ~~~\n");

val x = bmap (fn x => x*x) (intbseq 2);
CHECK ("bmap test 1 subtest 1") ((bHead x) = 4);
val x = bForward x;
CHECK ("bmap test 1 subtest 2") ((bHead x) = 9);
val x = bForward x;
CHECK ("bmap test 1 subtest 3") ((bHead x) = 16);
val x = bForward x;
CHECK ("bmap test 1 subtest 4") ((bHead x) = 25);
val x = bBack x;
CHECK ("bmap test 1 subtest 5") ((bHead x) = 16);
val x = bBack x;
CHECK ("bmap test 1 subtest 6") ((bHead x) = 9);
val x = bBack x;
CHECK ("bmap test 1 subtest 7") ((bHead x) = 4);
val x = bBack x;
CHECK ("bmap test 1 subtest 8") ((bHead x) = 1);
val x = bBack x;
CHECK ("bmap test 1 subtest 9") ((bHead x) = 0);
val x = bBack x;
CHECK ("bmap test 1 subtest 10") ((bHead x) = 1);
val x = bBack x;
CHECK ("bmap test 1 subtest 11") ((bHead x) = 4);
val x = bBack x;
CHECK ("bmap test 1 subtest 12") ((bHead x) = 9);

val _ = print("\n~~~ Testing function: bmap - subest 2 ~~~\n");

val x = bmap (fn x => x div 2) (intbseq 3);
CHECK ("bmap test 2 subtest 1") ((bHead x) = 1);
val x = bForward x;
CHECK ("bmap test 2 subtest 2") ((bHead x) = 2);
val x = bForward x;
CHECK ("bmap test 2 subtest 3") ((bHead x) = 2);
val x = bForward x;
CHECK ("bmap test 2 subtest 4") ((bHead x) = 3);
val x = bForward x;
CHECK ("bmap test 2 subtest 5") ((bHead x) = 3);
val x = bBack x;
CHECK ("bmap test 2 subtest 6") ((bHead x) = 3);
val x = bBack x;
CHECK ("bmap test 2 subtest 7") ((bHead x) = 2);
val x = bBack x;
CHECK ("bmap test 2 subtest 8") ((bHead x) = 2);
val x = bBack x;
CHECK ("bmap test 2 subtest 9") ((bHead x) = 1);
val x = bBack x;
CHECK ("bmap test 2 subtest 10") ((bHead x) = 1);
val x = bBack x;
CHECK ("bmap test 2 subtest 11") ((bHead x) = 0);
val x = bBack x;
CHECK ("bmap test 2 subtest 12") ((bHead x) = 0);
val x = bBack x;
CHECK ("bmap test 2 subtest 13") ((bHead x) = ~1);
val x = bBack x;
CHECK ("bmap test 2 subtest 14") ((bHead x) = ~1);
val x = bBack x;
CHECK ("bmap test 2 subtest 15") ((bHead x) = ~2);

val _ = print("\n~~~ Testing function: bmap - subest 3 ~~~\n");

val x = bmap (fn x => Int.toString x) (intbseq 1);
CHECK ("bmap test 3 subtest 1") ((bHead x) = "1");
val x = bForward x;
CHECK ("bmap test 3 subtest 2") ((bHead x) = "2");
val x = bForward x;
CHECK ("bmap test 3 subtest 3") ((bHead x) = "3");
val x = bBack x;
CHECK ("bmap test 3 subtest 4") ((bHead x) = "2");
val x = bBack x;
CHECK ("bmap test 3 subtest 5") ((bHead x) = "1");

val _ = print("\n~~~ Testing function: bmap - subest 4 ~~~\n");

val x = bmap (fn x => if x mod 2 = 0 then x div 2 else x div 3) (intbseq 15);
CHECK ("bmap test 4 subtest 1") ((bHead x) = 5);
val x = bForward x;
CHECK ("bmap test 4 subtest 2") ((bHead x) = 8);
val x = bForward x;
CHECK ("bmap test 4 subtest 3") ((bHead x) = 5);
val x = bForward x;
CHECK ("bmap test 4 subtest 4") ((bHead x) = 9);
val x = bForward x;
CHECK ("bmap test 4 subtest 5") ((bHead x) = 6);
val x = bForward x;
CHECK ("bmap test 4 subtest 6") ((bHead x) = 10);
val x = bBack x;
CHECK ("bmap test 4 subtest 7") ((bHead x) = 6);
val x = bBack x;
CHECK ("bmap test 4 subtest 8") ((bHead x) = 9);

val _ = print("\n~~~ Testing function: bmap - subest 5 ~~~\n");

val x = bmap (fn x => factorial x) (intbseq 1);
CHECK ("bmap test 5 subtest 1") ((bHead x) = 1);
val x = bForward x;
CHECK ("bmap test 5 subtest 2") ((bHead x) = 2);
val x = bForward x;
CHECK ("bmap test 5 subtest 3") ((bHead x) = 6);
val x = bForward x;
CHECK ("bmap test 5 subtest 4") ((bHead x) = 24);
val x = bForward x;
CHECK ("bmap test 5 subtest 5") ((bHead x) = 120);
val x = bForward x;
CHECK ("bmap test 5 subtest 6") ((bHead x) = 720);
val x = bBack x;
CHECK ("bmap test 5 subtest 7") ((bHead x) = 120);
val x = bBack x;
CHECK ("bmap test 5 subtest 8") ((bHead x) = 24);

val _ = print("\n~~~ Testing function: bmap - subest 6 ~~~\n");

val x = bmap (fn x => fibonacci x) (intbseq 15);
CHECK ("bmap test 6 subtest 1") ((bHead x) = 610);
val x = bBack x;
CHECK ("bmap test 6 subtest 2") ((bHead x) = 377);
val x = bBack x;
CHECK ("bmap test 6 subtest 3") ((bHead x) = 233);
val x = bBack x;
CHECK ("bmap test 6 subtest 4") ((bHead x) = 144);
val x = bBack x;
CHECK ("bmap test 6 subtest 5") ((bHead x) = 89);
val x = bBack x;
CHECK ("bmap test 6 subtest 6") ((bHead x) = 55);
val x = bForward x;
CHECK ("bmap test 6 subtest 7") ((bHead x) = 89);
val x = bForward x;
CHECK ("bmap test 6 subtest 8") ((bHead x) = 144);

(* Testing function: bfilter *)

val _ = print("\n~~~ Testing function: bfilter - subest 1 ~~~\n");

val x = bfilter (fn x => x mod 2 = 0) Back (intbseq 2);
CHECK ("bfilter test 1 subtest 1") ((bHead x) = 2);
val x = bForward x;
CHECK ("bfilter test 1 subtest 2") ((bHead x) = 4);
val x = bForward x;
CHECK ("bfilter test 1 subtest 3") ((bHead x) = 6);
val x = bBack x;
CHECK ("bfilter test 1 subtest 4") ((bHead x) = 4);
val x = bBack x;
CHECK ("bfilter test 1 subtest 5") ((bHead x) = 2);
val x = bBack x;
CHECK ("bfilter test 1 subtest 6") ((bHead x) = 0);
val x = bBack x;
CHECK ("bfilter test 1 subtest 7") ((bHead x) = ~2);
val x = bBack x;
CHECK ("bfilter test 1 subtest 8") ((bHead x) = ~4);

val _ = print("\n~~~ Testing function: bfilter - subest 2 ~~~\n");

val x = bfilter (fn x => x mod 2 = 0) Back (intbseq 1);
CHECK ("bfilter test 2 subtest 1") ((bHead x) = 0);
val x = bForward x;
CHECK ("bfilter test 2 subtest 2") ((bHead x) = 2);
val x = bForward x;
CHECK ("bfilter test 2 subtest 3") ((bHead x) = 4);
val x = bForward x;
CHECK ("bfilter test 2 subtest 4") ((bHead x) = 6);
val x = bForward x;
CHECK ("bfilter test 2 subtest 5") ((bHead x) = 8);
val x = bBack x;
CHECK ("bfilter test 2 subtest 6") ((bHead x) = 6);


val _ = print("\n~~~ Testing function: bfilter - subest 3 ~~~\n");

val x = bfilter (fn x => x mod 2 = 0) Forward (intbseq 1);
CHECK ("bfilter test 3 subtest 1") ((bHead x) = 2);
val x = bForward x;
CHECK ("bfilter test 3 subtest 2") ((bHead x) = 4);
val x = bForward x;
CHECK ("bfilter test 3 subtest 3") ((bHead x) = 6);
val x = bForward x;
CHECK ("bfilter test 3 subtest 4") ((bHead x) = 8);
val x = bForward x;
CHECK ("bfilter test 3 subtest 5") ((bHead x) = 10);
val x = bBack x;
CHECK ("bfilter test 3 subtest 6") ((bHead x) = 8);

val _ = print("\n~~~ Testing function: bfilter - subest 4 ~~~\n");

val x = bfilter (fn x => isPrime x) Forward (intbseq 15);
CHECK ("bfilter test 4 subtest 1") ((bHead x) = 17);
val x = bForward x;
CHECK ("bfilter test 4 subtest 2") ((bHead x) = 19);
val x = bForward x;
CHECK ("bfilter test 4 subtest 3") ((bHead x) = 23);
val x = bForward x;
CHECK ("bfilter test 4 subtest 4") ((bHead x) = 25);
val x = bForward x;
CHECK ("bfilter test 4 subtest 5") ((bHead x) = 31);
val x = bForward x;
CHECK ("bfilter test 4 subtest 5") ((bHead x) = 37);
val x = bForward x;
CHECK ("bfilter test 4 subtest 5") ((bHead x) = 41);
val x = bBack x;
CHECK ("bfilter test 4 subtest 6") ((bHead x) = 37);

val _ = print("\n~~~ Testing function: bfilter - subest 5 ~~~\n");

val x = bfilter (fn x => isPrime x) Back (intbseq 15);
CHECK ("bfilter test 5 subtest 1") ((bHead x) = 13);
val x = bBack x;
CHECK ("bfilter test 5 subtest 2") ((bHead x) = 11);
val x = bBack x;
CHECK ("bfilter test 5 subtest 3") ((bHead x) = 7);
val x = bBack x;
CHECK ("bfilter test 5 subtest 4") ((bHead x) = 5);
val x = bBack x;
CHECK ("bfilter test 5 subtest 5") ((bHead x) = 3);
val x = bBack x;

val _ = print("\n~~~ Testing function: bfilter - subest 6 ~~~\n");

val x = bfilter (fn x => isPerfect x) Forward (intbseq 2);
CHECK ("bfilter test 6 subtest 1") ((bHead x) = 6);
val x = bForward x;
CHECK ("bfilter test 6 subtest 2") ((bHead x) = 28);
val x = bForward x;
CHECK ("bfilter test 6 subtest 3") ((bHead x) = 496);
val x = bBack x;
CHECK ("bfilter test 6 subtest 4") ((bHead x) = 28);

(* Testing function: seq2bseq *)

val _ = print("\n~~~ Testing function: seq2bseq - subest 1 ~~~\n");

val x = seq2bseq (downfrom ~1) (from 0);
CHECK ("seq2bseq test 1 subtest 1") ((bHead x) = 0);
val x = bForward x;
CHECK ("seq2bseq test 1 subtest 2") ((bHead x) = 1);
val x = bForward x;
CHECK ("seq2bseq test 1 subtest 3") ((bHead x) = 2);
val x = bForward x;
CHECK ("seq2bseq test 1 subtest 4") ((bHead x) = 3);
val x = bBack x;
CHECK ("seq2bseq test 1 subtest 5") ((bHead x) = 2);
val x = bBack x;
CHECK ("seq2bseq test 1 subtest 6") ((bHead x) = 1);

val _ = print("\n~~~ Testing function: seq2bseq - subest 2 ~~~\n");

val x = seq2bseq (oddFrom 15) (evenTo 0);
CHECK ("seq2bseq test 2 subtest 1") ((bHead x) = 0);
val x = bForward x;
CHECK ("seq2bseq test 2 subtest 2") ((bHead x) = 2);
val x = bForward x;
CHECK ("seq2bseq test 2 subtest 3") ((bHead x) = 4);
val x = bForward x;
CHECK ("seq2bseq test 2 subtest 4") ((bHead x) = 6);
val x = bForward x;
CHECK ("seq2bseq test 2 subtest 5") ((bHead x) = 8);
val x = bForward x;
CHECK ("seq2bseq test 2 subtest 6") ((bHead x) = 10);
val x = bBack x;
CHECK ("seq2bseq test 2 subtest 7") ((bHead x) = 8);
val x = bBack x;
CHECK ("seq2bseq test 2 subtest 8") ((bHead x) = 6);

(* Testing function: bSeqJump *)

val _ = print("\n~~~ Testing function: bSeqJump - subest 1 ~~~\n");

val x = intbseq 0;
CHECK ("bSeqJump test 1 subtest 1") ((bHead x) = 0);
val x = bSeqJump x 3;
CHECK ("bSeqJump test 1 subtest 2") ((bHead x) = 0);
val x = bForward x;
CHECK ("bSeqJump test 1 subtest 3") ((bHead x) = 3);
val x = bForward x;
CHECK ("bSeqJump test 1 subtest 4") ((bHead x) = 6);
val x = bBack x;
CHECK ("bSeqJump test 1 subtest 5") ((bHead x) = 3);
val x = bBack x;
CHECK ("bSeqJump test 1 subtest 6") ((bHead x) = 0);
val x = bBack x;
CHECK ("bSeqJump test 1 subtest 7") ((bHead x) = ~3);

val _ = print("\n~~~ Testing function: bSeqJump - subest 2 ~~~\n");

val x = bSeqJump (bfilter (fn x => (isEven x)) Back (intbseq 11)) 5;
CHECK ("bSeqJump test 2 subtest 1") ((bHead x) = 10);
val x = bForward x;
CHECK ("bSeqJump test 2 subtest 2") ((bHead x) = 20);
val x = bForward x;
CHECK ("bSeqJump test 2 subtest 3") ((bHead x) = 30);
val x = bForward x;
CHECK ("bSeqJump test 2 subtest 4") ((bHead x) = 40);
val x = bForward x;
CHECK ("bSeqJump test 2 subtest 5") ((bHead x) = 50);
val x = bBack x;
CHECK ("bSeqJump test 2 subtest 6") ((bHead x) = 40);
val x = bBack x;
CHECK ("bSeqJump test 2 subtest 7") ((bHead x) = 30);

val _ = print("\n~~~ Testing function: bSeqJump - subest 3 ~~~\n");

val x = bSeqJump (bfilter (fn x => (isPrime x)) Back (intbseq 11)) 5;
CHECK ("bSeqJump test 3 subtest 1") ((bHead x) = 11);
val x = bForward x;
CHECK ("bSeqJump test 3 subtest 2") ((bHead x) = 29);
val x = bForward x;
CHECK ("bSeqJump test 3 subtest 3") ((bHead x) = 47);
val x = bForward x;
CHECK ("bSeqJump test 3 subtest 4") ((bHead x) = 71);
val x = bForward x;
CHECK ("bSeqJump test 3 subtest 5") ((bHead x) = 97);
val x = bBack x;
CHECK ("bSeqJump test 3 subtest 6") ((bHead x) = 71);
val x = bBack x;
CHECK ("bSeqJump test 3 subtest 7") ((bHead x) = 47);

val _ = print("\n~~~ Testing function: bSeqJump - subest 4 ~~~\n");

val x = bSeqJump (bfilter (fn x => (isPrime x)) Back (intbseq 100)) 8;
CHECK ("bSeqJump test 4 subtest 1") ((bHead x) = 97);
val x = bForward x;
CHECK ("bSeqJump test 4 subtest 2") ((bHead x) = 137);
val x = bForward x;
CHECK ("bSeqJump test 4 subtest 3") ((bHead x) = 179);
val x = bForward x;
CHECK ("bSeqJump test 4 subtest 4") ((bHead x) = 227);
val x = bForward x;
CHECK ("bSeqJump test 4 subtest 5") ((bHead x) = 269);
val x = bBack x;
CHECK ("bSeqJump test 4 subtest 6") ((bHead x) = 227);
val x = bBack x;
CHECK ("bSeqJump test 4 subtest 7") ((bHead x) = 179);
