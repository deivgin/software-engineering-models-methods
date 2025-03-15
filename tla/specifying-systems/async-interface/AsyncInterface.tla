---- MODULE AsyncInterface ----
EXTENDS Naturals

CONSTANT Data
VARIABLES value, ready, acknowledge
vars == <<value, ready, acknowledge>>

Send ==
    /\ ready = acknowledge
    /\ value' \in Data
    /\ ready' = 1 - ready
    /\ UNCHANGED acknowledge

Receive ==
    /\ ready # acknowledge
    /\ acknowledge' = 1 - acknowledge
    /\ UNCHANGED <<value, ready>>

TypeOk ==
    /\ value \in Data
    /\ ready \in {0,1}
    /\ acknowledge \in {0,1}

Init ==
    /\ value \in Data
    /\ ready \in {0,1}
    /\ acknowledge = ready

Next == Send \/ Receive

Spec == Init /\ [][Next]_vars

---------------------------------

THEOREM Spec => []TypeOk

====
