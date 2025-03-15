---- MODULE GCD ----
EXTENDS Naturals

CONSTANT A, B
\* What is Assume?
\* ASSUME AssumeAB == A \in Nat /\ B \in Nat

VARIABLES a, b
vars == <<a, b>>

TypeOk ==
    /\ a \in Nat
    /\ b \in Nat

Init ==
    /\ a = A
    /\ b = B

StepA ==
    /\ a > b
    /\ a' = a - b
    /\ UNCHANGED b

StepB ==
    /\ b > a
    /\ b' = b - a
    /\ UNCHANGED a

Next == StepA \/ StepB

Spec == Init /\ [][Next]_vars /\ WF_vars(Next)

-------------------------------------

LessInv ==
    /\ a \leq A
    /\ b \leq B

Divides(n, c) == \E x \in 1..n : n = c * x
CommonDivisor(c) == Divides(A, c) /\ Divides(B, c)
GreatestCommonDivisor(c) ==
    /\ CommonDivisor(c)
    /\ \A d \in 1..c : CommonDivisor(c) => d \leq c

\* Cant understand this
EqImpliesGCD == (a = b) => GreatestCommonDivisor(a)
EventuallyEq == <>[](a = b)

--------------------------------------
\* For this to work need to install TLAPS

\* INSTANCE TLAPS

\* \* Also yet do not understand
\* THEOREM Spec => []TypeOk
\*     <1>1. Init => TypeOk
\*         BY AssumeAB DEF Init, TypeOk
\*     <1>2. TypeOk /\ [Next]_vars => TypeOk'
\*         BY DEF TypeOk, Next, vars, StepA, StepB
\*     <1>q. QED BY <1>1, <1>2, PTL DEF Spec, vars

====
