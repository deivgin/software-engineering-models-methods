---- MODULE HourClock ----
EXTENDS Naturals

VARIABLE hour

Init == hour \in (1 .. 12)

\* Next == hour' = IF hour # 12 THEN hour + 1 ELSE 1
Next == hour' = (hour % 12) + 1

Spec == Init /\ [][Next]_hour

THEOREM Spec => []Init

====
