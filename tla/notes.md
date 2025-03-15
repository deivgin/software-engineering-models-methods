# Notes on TLA+

## Basics

- TLA is not compiled or interpreted, it is checked by the TLC model checker.
- TLA forces you to be specific when specifying you needs.

- **Invariant** - something true in every state of the system. Always holds true.
- **Temporal properties** - patterns that must hold across the entire execution of the system.

- To check if our specification works, we need to create a **model** a simulation we want to run.

- Stuttering - when process simply stops.

## Propositional logic

/\ - and
\/ - or
~ - negation
=> - implication
<=> - equivalence
\leq - less or equal

## Sets

{} - Set. Unordered collection of things.

\in - membership
\notion - non-membership
\subseteq - subset
\union - union
\intersect - intersection
\ - set difference
SUBSET - power set

## Predicate logic

\A - universal quantifier
\E - existential quantifier

## Temporal logic

[] - Always. []P means that P is true in every state of the behavior.
<> - Eventually. <>P means that P eventually is true in some future state.
~> - Leads to. P ~> Q means that whenever P becomes true, Q will eventually become true.
=> - Implies. Expresses relationships?
<>[] - Eventually-Always. The end of an algorithm given equation eventually is always true.

## Sequence operators

Seq(S) - set of all sequences of elements of the set S
Head(s) - first element of the sequence s
Tail(s) - tail of sequence s, meaning s with its head removed
Append(s, e) - add element e to the tail of s
Len(s) - the amount of elements in sequence s

## Dictionary

[] - Function. Similar to dictionaries and mappings in programming.
For each Value in a given set, it maps an output value.

value' - value prime, represents new value after action is performed.

DOMAIN - specifies list indexes
LAMBDA -
