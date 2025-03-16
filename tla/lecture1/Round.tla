---- MODULE Round ----
(***************************************************************************)
(* This specification defines a way to share a secret S that can be received *)
(* by 2 or more participants. For this a Round synchronization algorithm is*)
(* used. Synchronization is done by splitting time into Rounds. No message *)
(* can include information from the previous Round. Since the internet is  *)
(* asynchronous, each Node sends a message upon completion and each node   *)
(* proceeds to the next round only if upon receiving messages from all of  *)
(*   *)
(***************************************************************************)
EXTENDS Naturals
CONSTANTS Nodes, Rounds
VARIABLES round, done, messages
vars == <<round, done, messages>>

Messages == [n: Nodes, r: Rounds]

TypeOK ==
  /\ round \in [Nodes -> Rounds]
  /\ done \in [Nodes -> [Rounds -> BOOLEAN]]
  /\ messages \in SUBSET Messages

------------------

Send(n) ==
  LET r == round[n]
  IN
    /\ ~done[n][r]
    /\ done' = [done EXCEPT ![n][r] = TRUE]
    /\ messages' = messages \cup {[n |-> n, r |-> r]}
    /\ UNCHANGED round

Receive(n) ==
  /\ round[n] + 1 \in Rounds
  /\ [n: Nodes, r: {round[n]}] \subseteq messages
  /\ round' = [round EXCEPT ![n] = @ + 1]
  /\ UNCHANGED <<done, messages>>

------------------

Init ==
  /\ round = [n \in Nodes |-> 0]
  /\ done = [n \in Nodes |-> [r \in Rounds |-> FALSE]]
  /\ messages = {}

Next ==
  \E n \in Nodes:
    \/ Send(n)
    \/ Receive(n)

Spec == Init /\ [][Next]_vars /\ WF_vars(Next)

------------------

RoundActive(n, r) ==
    /\ round[n] = r
    /\ ~done[n][r]

RoundsIsolated ==
  \A n1, n2 \in Nodes:
    \A r1, r2 \in Rounds:
      (RoundActive(n1, r1) /\ RoundActive(n2, r2)) => (r1 = r2)

EachRoundIsReached ==
  \A n \in Nodes, r \in Rounds : <>(round[n] = r)

====
