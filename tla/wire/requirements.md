# Wire feature

This feature seeks to add the ability to transfer funds from one account to any other.

Requirements:

- Each wire must be between two accounts and transfer at least 1 dollar.
- If a wire is successful, the value of the wire is deducted from the sender account and added to the receiver account.
- If the wire fails, the two accounts are unchanged.
- A wire may not cause an account to have a negative balance.
- For scaling reasons, multiple wires may happen simultaneously.
