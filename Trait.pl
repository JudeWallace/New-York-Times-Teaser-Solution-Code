:- use_module(library(clpfd)).

/*Begin Question 4.1*/
divisible( X, Y )
  :- N is Y*Y,
     N =< X,
     X mod Y =:= 0.
divisible( X, Y )
  :- Y < X,
     Y1 is Y + 1,
     divisible( X, Y1 ).

prime( X )
  :- Y is 2, 
     X  >  1, 
     \+ divisible( X, Y ).
/*End Question 4.1*/

/*Begin Question 4.2*/
possible(X, Y, Z)
  :- permutation([1,2,3,4,5,6,7,8,9], [X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]),
     X is X1*100 + X2*10 + X3,
     Y is Y1*100 + Y2*10 + Y3,
     Z is Z1*100 + Z2*10 + Z3,
     X < 360,
     Y < 360,
     Z =< 360,
     X < Y,
     Y < Z.
/*End Question 4.2*/

/*Begin Question 4.3*/
checkunique(X,Y,Z) 
  :- name(X,XCodes),
     name(Y,YCodes),
     name(Z,ZCodes),
     append(XCodes,YCodes,Temp),
     append(Temp,ZCodes,List1),
     all_different(List1),
     forall(member(Element, List1), member(Element, 
                                     [49, 50, 51, 52, 53, 54, 55, 56, 57])).

acceptable( X, Y, Z ) 
  :- not(prime( X )),
     not(prime( Y )),
     not(prime( Z )),
     X < 360,
     Y < 360,
     Z =< 360,
     X < Y,
     Y < Z,
     checkunique(X,Y,Z),
     X1 is X // 90,
     Y1 is Y // 90,
     Z1 is Z // 90,
     X1 + Y1 + Z1 =:= 6.
    
trait( X, Y, Z )
  :- possible( X, Y, Z ),
     acceptable( X, Y, Z ).
/*End Question 4.3*/

/*any main predicates for testing goes here*/
