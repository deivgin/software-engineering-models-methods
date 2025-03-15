---- MODULE GCD_Module ----
EXTENDS GCD

CONSTANT R

CorrectR ==
    /\ a = R
    /\ b = R

EventuallyR ==
    <>[]CorrectR

====
