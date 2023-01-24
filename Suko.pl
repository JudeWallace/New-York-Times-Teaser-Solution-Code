/*Begin Question 3.1*/
indices( [], _, [] ).
indices( [H|T], E, [W|V] )
  :- nth0( H, E, W ),
     indices( T, E, V ).
/* End Question 3.1 */

/*Begin Question 3.2*/
permutation([], []).
permutation([H|T], W) 
  :- permutation(T, S),
     select(H, W, S).

possible( GRID )
  :- permutation( [1,2,3,4,5,6,7,8,9], GRID).  
/* End Question 3.2 */

/*Begin Question 3.3*/
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
  :- indices( US, GRID , C1),
     sum_list(C1, CV),
     CV =:= U,
     indices( VS, GRID , C2),
     sum_list(C2, CV2),
     CV2 =:= V,
     indices( WS, GRID , C3),
     sum_list(C3, CV3),
     CV3 =:= W,
     indices([0,1,3,4], GRID, Q1),
     sum_list(Q1, QV1),
     QV1 =:= T0,
     indices([1,2,4,5], GRID, Q2),
     sum_list(Q2, QV2),
     QV2 =:= T1,
     indices([3,4,6,7], GRID, Q3),
     sum_list(Q3, QV3),
     QV3 =:= T2,
     indices([4,5,7,8], GRID, Q4),
     sum_list(Q4, QV4),
     QV4 =:= T3.
    
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
  :- possible( GRID ), 
     acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).
/*End Question 3.3*/

/*any main predicates for testing goes here*/