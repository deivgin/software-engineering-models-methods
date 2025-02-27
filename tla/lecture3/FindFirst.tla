---- MODULE FindFirst ----
EXTENDS Sequences, Naturals

\* Imperative - we define each step to find first
RECURSIVE FindFirstRecStep(_, _, _)
FindFirstRecStep(element, list, n) ==
    IF list = <<>>
    THEN 0
    ELSE IF Head(list) = element
            THEN n
            ELSE FindFirstRecStep(element, Tail(list), n + 1)

FindFirstRecursive(element, list) == FindFirstRecStep(element, list, 1)

\* Declarative approach - we define properties that it should have
\* If you can avoid using choose, then not use it, but here it is ok
FindFirstChoose(element, list) ==
    CHOOSE n \in Nat :
        IF \E i \in DOMAIN list : list[i] = element
        THEN
            /\ n \in DOMAIN list
            /\ list[n] = element
            /\ \A i \in 1..n-1 : list[i] # element
        ELSE n = 0

FindFirstExists(element, list, Predicate(_)) ==
    \/ \E n \in DOMAIN list :
        /\ list[n] = element
        /\ \A i \in 1..n-1 : list[i] # element
        /\ Predicate(n)
    \/ \A n \in DOMAIN list :
        /\ list[n] # element
        /\ Predicate(0)

IsFirst(element, list, n) ==
    /\ n \in DOMAIN list
    /\ list[n] = element
    /\ \A i \in 1..n-1 : list[n] # element

\* TODO: needs to be fixed
isFirstOrNotAvailable(element, list, n) ==
    \/ IsFirst(element, list, n)
    \/ n = 0 /\ \A i \in DOMAIN list : list[i] # element
====
