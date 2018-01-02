# Bank Tech Test

[Task](#task) | [Approach](#approach) | [Execution](#execution) | [Struggles](#struggles) | [Demo](#demo) | [Technologies](#technologies)

## <a name="task">Task</a>

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
## <a name="approach">Approach</a>

Prior to writing any code I chose to sit down and read through exactly what was required for this tech test. Following this I generated a basic set of user stories which allowed me to structure the development of my code. These are as follows:

```
As a prospective customer,
So that I can start saving,
I want to be able to open an account.

As an account holder,
So I can increase my balance,
I want to be able to add credit to my account.

As an account holder,
So I can spend my money,
I want to be able to debit from my account.

As an account holder,
So I can keep track of my transactions,
I want each transaction to be saved with a date, credit, debit and balance value.

As an account holder,
So I can see my savings and spendings,
I want to be able to print an account summary showing all transactions.
```
