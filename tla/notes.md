# Notes for learning TLA+

These notes are taken from analysis of book "Practical TLA+ Planning Driven Development" by Hillel Wayne.

## Basics

- TLA is not compiled or interpreted, it is checked by the TLC model checker.
- TLA forces you to be specific when specifying you needs.

- **Invariant** - something true in every state of the system. Always holds true.
- **Temporal properties** - patterns that must hold across the entire execution of the system.

- To check if our specification works, we need to create a **model** a simulation we want to run.

- Stuttering - when process simply stops.

## Dictionary

{} - Set. Unordered collection of things.

[] - Function. Similar to dictionaries and mappings in programming.
For each Value in a given set, it maps an output value.

\A - for all. "Universal quantification".
\E - exists.

value' - value prime, represents new value after action is performed.

### Operators

== - definition operator. Associates identifier with an expression.

### Logical Conditions

/\ - AND.

### Temporal operators

[] - Always. []P means that P is true in every state of the behavior.
<> - Eventually. <>P means that P eventually is true in some future state.
~> - Leads to. P ~> Q means that whenever P becomes true, Q will eventually become true.
=> - Implies. Expresses relationships?
<>[] - Eventually-Always. The end of an algorithm given equation eventually is always true.

## Words

DOMAIN - specifies list indexes
LAMBDA -

## Functions

Seq() -
