# Notes for learning TLA+

These notes are taken from analysis of book "Practical TLA+ Planning Driven Development" by Hillel Wayne.

## Basics

- TLA is not compiled or interpreted, it is checked by the TLC model checker.
- TLA forces you to be specific when specifying you needs.

- **Invariant** - something true in every state of the system. Always holds true.

- To check if our specification works, we need to create a **model** a simulation we want to run.

## Dictionary

{} - Set. Unordered collection of things.

[] - Function. Similar to dictionaries and mappings in programming.
For each Value in a given set, it maps an output value.

Invariant == Bool - defines invariants that must be true in every system state.

\A - for all. "Universal quantification".

== - definition operator. Associates identifier with an expression.

/\ - logical AND condition.

value' - value prime, represents new value after action is performed.
