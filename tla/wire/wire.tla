---- MODULE wire ----
EXTENDS Integers

\* algorithm is a PlusCal feature
(*--algorithm wire
variables
    people = {"alice", "bob"},
    acc = [p \in people |-> 5],
    sender = "alice",
    receiver = "bob",
    amount \in 1..acc[sender];

define
    NoOverdrafts == \A p \in people: acc[p] >= 0
end define;

begin
    Withdraw:
        acc[sender] := acc[sender] - amount;
    Deposit:
        acc[receiver] := acc[receiver] + amount;
end algorithm;*)
\* BEGIN TRANSLATION (chksum(pcal) = "f8cc1ca0" /\ chksum(tla) = "cd5df1cf")
VARIABLES pc, people, acc, sender, receiver, amount

(* define statement *)
NoOverdrafts == \A p \in people: acc[p] >= 0


vars == << pc, people, acc, sender, receiver, amount >>

Init == (* Global variables *)
        /\ people = {"alice", "bob"}
        /\ acc = [p \in people |-> 5]
        /\ sender = "alice"
        /\ receiver = "bob"
        /\ amount \in 1..acc[sender]
        /\ pc = "Withdraw"

Withdraw == /\ pc = "Withdraw"
            /\ acc' = [acc EXCEPT ![sender] = acc[sender] - amount]
            /\ pc' = "Deposit"
            /\ UNCHANGED << people, sender, receiver, amount >>

Deposit == /\ pc = "Deposit"
           /\ acc' = [acc EXCEPT ![receiver] = acc[receiver] + amount]
           /\ pc' = "Done"
           /\ UNCHANGED << people, sender, receiver, amount >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Withdraw \/ Deposit
           \/ Terminating

Fairness == WF_vars(Withdraw) /\ WF_vars(Deposit)

Spec == Init /\ [][Next]_vars /\ Fairness

Termination == <>(pc = "Done")

\* END TRANSLATION
====
