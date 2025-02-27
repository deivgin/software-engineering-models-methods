---- MODULE FindFirst_SM_Refined ----
EXTENDS FindFirst_SM

\* TODO: Update it as it is not complete
Abstract == INSTANCE FindFirst_SM_Abstract
                WITH result <- (IF done THEN result ELSE 1)

Refinement == Abstract!Spec

THEOREM Spec => Refinement

====
