---- MODULE FindFirst_SM_Abstract ----
EXTENDS Sequences, Naturals, FindFirst

CONSTANT Elements

VARIABLE element
VARIABLE list
VARIABLE done
VARIABLE result

vars == <<element, list, done, result>>

TypeOk ==
    /\ element \in Elements
    /\ list \in Seq(Elements)
    /\ done \in BOOLEAN
    /\ result \in Nat

StepMagic ==
        /\ ~done
        /\ \E n \in Nat :
            /\ isFirstOrNotAvailable(element, list, n)
            /\ result' = n
            /\ done' = TRUE
        /\ UNCHANGED <<element, list, result>>


Init ==
    /\ element \in Elements
    /\ \E n \in Nat :
        /\ n + 1 \in Nat
        /\ list \in [1..n -> Elements]
    /\ done = FALSE
    /\ result = 1

Next == StepMagic
Spec == Init /\ [][Next]_vars /\ WF_vars(Next)

ResultOk == done => isFirstOrNotAvailable(element, list, result)
Terminates == <>[]done

====
