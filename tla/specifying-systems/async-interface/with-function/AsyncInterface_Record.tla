---- MODULE AsyncInterface_Record ----
EXTENDS Naturals

CONSTANT Data
VARIABLES chanel

TypeOk == chanel \in [value: Data, ready: {0,1}, acknowledge: {0,1}]

Init ==
    /\ TypeOk
    /\ chanel.ready = chanel.acknowledge

Send(data) ==
    /\ chanel.ready = chanel.acknowledge
    /\ chanel' = [value |-> data, ready |-> 1 - chanel.ready, acknowledge |-> chanel.acknowledge]

Receive ==
    /\ chanel.ready # chanel.acknowledge
    /\ chanel' = [chanel EXCEPT !.acknowledge = 1 - @]

Next == (\E data \in Data : Send(data)) \/ Receive

Spec == Init /\ [][Next]_chanel

---------------------------------

THEOREM Spec => []TypeOk

====
