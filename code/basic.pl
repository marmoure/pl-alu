/*************
   NOT
    _______
    |     |
  A-| NOT |-OUT
    |_____|
*************/
%   A  OUT
not(0,  1 ).
not(1,  0 ).

/*************
   AND Gate
    _______
  A-|     |
    | AND |-OUT
  B-|_____|
*************/
%   A  B  OUT
and(0, 0,  0 ).
and(0, 1,  0 ).
and(1, 0,  0 ).
and(1, 1,  1 ).

/*************
   OR Gate
    ______
  A-|    |
    | OR |-OUT
  B-|____|
*************/
%  A  B  OUT
or(0, 0,  0 ).
or(0, 1,  1 ).
or(1, 0,  1 ).
or(1, 1,  1 ).

/*************
   XOR Gate
    _______
  A-|     |
    | XOR |-OUT
  B-|_____|
*************/
%   A  B  OUT
xor(0, 0,  0 ).
xor(0, 1,  1 ).
xor(1, 0,  1 ).
xor(1, 1,  0 ).

/*************
   Half Adder Gate
    _______
  A-|     |-sum
    | hadd|
  B-|_____|-carry
*************/
%   A  B  sum carry

halfadder(A,B,S,C) :-
	xor(A, B,  S ),
	and(A, B,  C ).
/*************
   Full Adder Gate
    _______
  A-|     |-sum
  c-| fadd|
  B-|_____|-carry
*************/
%   A  B  sum carry

fulladder(A,B,C,S,Carry) :-
	halfadder(A, B,  AB,Cab ),
	halfadder(AB, C,  S, Cs ),
	or(Cab,Cs,Carry).

/*************
    Add16 Gate
    _______
  A-|     |-sum
    |add16|
  B-|_____|-
*************/
%   A[16]  B[16]  sum[16] 


add16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16],[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]) :-
    halfadder(A1,B1,O1,C1),
    fulladder(A2,B2,C1,O2,C2),
    fulladder(A3,B3,C2,O3,C3),
    fulladder(A4,B4,C3,O4,C4),
    fulladder(A5,B5,C4,O5,C5),
    fulladder(A6,B6,C5,O6,C6),
    fulladder(A7,B7,C6,O7,C7),
    fulladder(A8,B8,C7,O8,C8),
    fulladder(A9,B9,C8,O9,C9),
    fulladder(A10,B10,C9,O10,C10),
    fulladder(A11,B11,C10,O11,C11),
    fulladder(A12,B12,C11,O12,C12),
    fulladder(A13,B13,C12,O13,C13),
    fulladder(A14,B14,C13,O14,C14),
    fulladder(A15,B15,C14,O15,C15),
    fulladder(A16,B16,C15,O16,C16).


/********
 
     MUX Gate

     SEL
    __|____
  A-|     |
    | MUX |-OUT
  B-|_____|
 ********/
%   A B SEL OUT

mux(A,B,0,   A).
mux(A,B,1,   B).


/********
 
 DMUX Gate

     SEL
    __|____
    |     |-A
 IN-| DMUX|
    |_____|-B
 ********/
%    IN SEL A B

dmux(IN,0,  IN,0).
dmux(IN,1,  0,IN).

/********
 
 AND16 Gate

        _______
  A[16]-|     |
        |AND16|-OUT[16]
  B[16]-|_____|
 ********/
% A[16] B[16] OUT[16]

and16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16],[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]) :-
    and(A1,B1,O1),
    and(A2,B2,O2),
    and(A3,B3,O3),
    and(A4,B4,O4),
    and(A5,B5,O5),
    and(A6,B6,O6),
    and(A7,B7,O7),
    and(A8,B8,O8),
    and(A9,B9,O9),
    and(A10,B10,O10),
    and(A11,B11,O11),
    and(A12,B12,O12),
    and(A13,B13,O13),
    and(A14,B14,O14),
    and(A15,B15,O15),
    and(A16,B16,O16).

/********
 
 OR8WAY Gate
        ________
        |      |
  IN[8]-|OR8WAY|-OUT
        |______|
 ********/
% IN[8] OUT
or8way([0,0,0,0,0,0,0],0).
or8way([_,_,_,_,_,_,_],1).

/********
 
 OR16WAY Gate
        _________
        |       |
 IN[16]-|OR16WAY|-OUT
        |_______|
 ********/
% IN[16] OUT
or16way([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],0).
or16way([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],1).
/************
 * NOT 16
 * 	_________
 	|	|
 IN[16]-| NOT16 | -OUT[16]
 	|_______|

***********/
%IN[16] OUT[16]
not16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]) :-
   not(A1,O1),
   not(A2,O2),
   not(A3,O3),
   not(A4,O4),
   not(A5,O5),
   not(A6,O6),
   not(A7,O7),
   not(A8,O8),
   not(A9,O9),
   not(A10,O10),
   not(A11,O11),
   not(A12,O12),
   not(A13,O13),
   not(A14,O14),
   not(A15,O15),
   not(A16,O16).

/********
 
 MUX16 Gate

	 sel
        __|_____
  A[16]-|     |
        |MUX16|-OUT[16]
  B[16]-|_____|
 ********/
% A[16] B[16] sel OUT[16]

and16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16],Sel,[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]) :-
    mux(A1,B1,Sel,O1),
    mux(A2,B2,Sel,O2),
    mux(A3,B3,Sel,O3),
    mux(A4,B4,Sel,O4),
    mux(A5,B5,Sel,O5),
    mux(A6,B6,Sel,O6),
    mux(A7,B7,Sel,O7),
    mux(A8,B8,Sel,O8),
    mux(A9,B9,Sel,O9),
    mux(A10,B10,Sel,O10),
    mux(A11,B11,Sel,O11),
    mux(A12,B12,Sel,O12),
    mux(A13,B13,Sel,O13),
    mux(A14,B14,Sel,O14),
    mux(A15,B15,Sel,O15),
    mux(A16,B16,Sel,O16).

%the final boss

alu([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16],ZX,NX,ZY,NY,F,NO,[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16],ZR,NG) :-
	%setting 0 using zx and zy
	mux16([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],ZX,[A01,A02,A03,A04,A05,A06,A07,A08,A09,A010,A011,A012,A013,A014,A015,A016]),
	mux16([B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],ZY,[B01,B02,B03,B04,B05,B06,B07,B08,B09,B010,B011,B012,B013,B014,B015,B016]),


	%the not function using nx and ny
	not16([A01,A02,A03,A04,A05,A06,A07,A08,A09,A010,A011,A012,A013,A014,A015,A016],[NA1,NA2,NA3,NA4,NA5,NA6,NA7,NA8,NA9,NA10,NA11,NA12,NA13,NA14,NA15,NA16]),
	not16([B01,B02,B03,B04,B05,B06,B07,B08,B09,B010,B011,B012,B013,B014,B015,B016],[NB1,NB2,NB3,NB4,NB5,NB6,NB7,NB8,NB9,NB10,NB11,NB12,NB13,NB14,NB15,NB16],

	mux16([A01,A02,A03,A04,A05,A06,A07,A08,A09,A010,A011,A012,A013,A014,A015,A016],[NA1,NA2,NA3,NA4,NA5,NA6,NA7,NA8,NA9,NA10,NA11,NA12,NA13,NA14,NA15,NA16],NX,[AN1,AN2,AN3,AN4,AN5,AN6,AN7,AN8,AN9,AN10,AN11,AN12,AN13,AN14,AN15,AN16]),
	mux16([B01,B02,B03,B04,B05,B06,B07,B08,B09,B010,B011,B012,B013,B014,B015,B016],[NB1,NB2,NB3,NB4,NB5,NB6,NB7,NB8,NB9,NB10,NB11,NB12,NB13,NB14,NB15,NB16],NY,[BN1,BN2,BN3,BN4,BN5,BN6,BN7,BN8,BN9,BN10,BN11,BN12,BN13,BN14,BN15,BN16]),

	%the current x=> ANn and y=> BNn
	add16([AN1,AN2,AN3,AN4,AN5,AN6,AN7,AN8,AN9,AN10,AN11,AN12,AN13,AN14,AN15,AN16],[BN1,BN2,BN3,BN4,BN5,BN6,BN7,BN8,BN9,BN10,BN11,BN12,BN13,BN14,BN15,BN16],[ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,ADD9,ADD10,ADD11,ADD12,ADD13,ADD14,ADD15,ADD16]),

	and16([AN1,AN2,AN3,AN4,AN5,AN6,AN7,AN8,AN9,AN10,AN11,AN12,AN13,AN14,AN15,AN16],[BN1,BN2,BN3,BN4,BN5,BN6,BN7,BN8,BN9,BN10,BN11,BN12,BN13,BN14,BN15,BN16],[AND1,AND2,AND3,AND4,AND5,AND6,AND7,AND8,AND9,AND10,AND11,AND12,AND13,AND14,AND15,AND16]),


	mux16([ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,ADD9,ADD10,ADD11,ADD12,ADD13,ADD14,ADD15,ADD16],[AND1,AND2,AND3,AND4,AND5,AND6,AND7,AND8,AND9,AND10,AND11,AND12,AND13,AND14,AND15,AND16],F,[XY1,XY2,XY3,XY4,XY5,XY6,XY7,XY8,XY9,XY10,XY11,XY12,XY13,XY14,XY15,XY16]),

	not16([XY1,XY2,XY3,XY4,XY5,XY6,XY7,XY8,XY9,XY10,XY11,XY12,XY13,XY14,XY15,XY16],[NXY1,NXY2,NXY3,NXY4,NXY5,NXY6,NXY7,NXY8,NXY9,NXY10,NXY11,NXY12,NXY13,NXY14,NXY15,NXY16]),
	mux16([XY1,XY2,XY3,XY4,XY5,XY6,XY7,XY8,XY9,XY10,XY11,XY12,XY13,XY14,XY15,XY16],[NXY1,NXY2,NXY3,NXY4,NXY5,NXY6,NXY7,NXY8,NXY9,NXY10,NXY11,NXY12,NXY13,NXY14,NXY15,NXY16],NO,[O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15,O16]),
		
	or16way([OO1,OO2,OO3,OO4,OO5,OO6,OO7,OO8,OO9,OO10,OO11,OO12,OO13,OO14,OO15,OO16],OZR),
	not(OZR,ZR).
