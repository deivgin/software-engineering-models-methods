---- MODULE FindFirst_SM ----
EXTENDS Sequences, Naturals, FindFirst

CONSTANT Elements

VARIABLE element
VARIABLE list
VARIABLE done
VARIABLE accumulator
VARIABLE result

vars == <<element, list, done, accumulator, result>>

\* Define variable types
TypeOk ==
    /\ element \in Elements
    /\ list \in Seq(Elements)
    /\ done \in BOOLEAN
    /\ accumulator \in Seq(Elements)
    /\ result \in Nat

NotInList ==
    /\ ~done
    /\ accumulator = <<>>
    /\ done' = TRUE
    /\ result' = 0
    /\ UNCHANGED <<element, list, accumulator>>

FoundInList ==
    /\ ~done
    /\ Len(accumulator) > 0
    /\ Head(accumulator) = element
    /\ done' = TRUE
    /\ UNCHANGED <<element, list, result, accumulator>>

NotFirst ==
    /\ ~done
    /\ Len(accumulator) > 0
    /\ Head(accumulator) # element
    /\ accumulator' = Tail(accumulator)
    /\ result' = result + 1
    /\ UNCHANGED <<element, list, done>>

Init ==
    /\ element \in Elements
    /\ \E n \in Nat :
        /\ n + 1 \in Nat
        /\ list \in [1..n -> Elements]
    /\ done = FALSE
    /\ accumulator = list
    /\ result = 1

Next == NotInList \/ FoundInList \/ NotFirst
Spec == Init /\ [][Next]_vars /\ WF_vars(Next)

ResultOk == done => isFirstOrNotAvailable(element, list, result)
Terminates == <>[]done

====
