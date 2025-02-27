---- MODULE FindFirst_test ----
EXTENDS FindFirst
VARIABLE testCase

Init ==
    testCase \in {
        [element |-> 2, list |-> <<5, 3, 2, 7, 2>>, result |-> 3],
        [element |-> 7, list |-> <<5, 3, 2, 7, 2>>, result |-> 4],
        [element |-> 1, list |-> <<5, 3, 2, 7, 2>>, result |-> 0]
    }

Next == UNCHANGED testCase

Spec == Init /\ [][Next]_testCase

TestRecursive == testCase.result = FindFirstRecursive(testCase.element, testCase.list)
TestChoose == testCase.result = FindFirstChoose(testCase.element, testCase.list)
TestExists == FindFirstExists(testCase.element, testCase.list, LAMBDA result : testCase.result = result)
TestInline ==
        LET element == testCase.element
            list == testCase.list
            result == testCase.result
        IN
        \/ \E n \in DOMAIN list :
            /\ list[n] = element
            /\ \A i \in 1..n-1 : list[i] # element
            /\ TRUE /\ (n = result)
        \/ \A n \in DOMAIN list : list[n] # element /\ result = 0
TestInlinePredicate ==
        LET element == testCase.element
            list == testCase.list
            result == testCase.result
        IN
        \/ \E n \in DOMAIN list :
            /\ IsFirst(element, list, n)
            /\ (n = result)
        \/ \A n \in DOMAIN list : list[n] # element /\ result = 0

THEOREM  Spec =>
            /\ []TestRecursive
            /\ []TestChoose
            /\ []TestExists
            /\ []TestInline
            /\ []TestInlinePredicate

====
