# Bank Tech Test

[Task](#task) | [Approach](#approach) | [Execution](#execution) | [Struggles](#struggles) | [Setup and Demo](#setup) | [Technologies](#technologies)

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

Prior to writing any code I sat down and read through exactly what was required for this tech test. Following this I generated a basic set of user stories which allowed me to structure the development of my code. These are as follows:

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
Generating these user stories allows me to break down the task into smaller problems. Each of these user stories was then broken down into progressively smaller pieces and built back up until the user story was complete.

## <a name="execution">Execution</a>

I have endeavoured to adhere to the Single Responsility Principal at all times, extracting code into new/private methods when the responsibility of a function increases. I also believe I have conformed to the Don't Repeat Yourself principal, removing duplicate/similar lines of code where possible and refactoring into single functions.

This piece of work allows you to succesfully create an account, credit and debit it as well as print your statement. To my knowledge all edge-cases have been accounted for. The user us unable to:

* Credit with a negative value
* Debit with a negative value
* Withdraw an amount that exceeds the balance

## <a name="struggles">Struggles</a>

While I believe I have fulfilled the acceptance criteria of this test there are some implementations that I would still like to implement should time allow.

My first and main concern is that I have limited the user to only be able to enter integers. The reason for this is because I am aware of the issues associated with using floats as a form of currency storage. The clear drawback of my solution however is that the user cannot credit or debit with a decimal value which is entirely unrealistic.

I strongly considered creating a Bank class that would recieve have a dependency of the class Account. The reason I decided against this is because I felt that it was a layer of extraction too great; I felt that I would simply be repeating the contents of the Account class within that of the Bank class, therefore preventing my code from being DRY. Therefore at the moment one can only create one account at a time. I believe this fulfills the requirements of this test but should multiple accounts need to be opened then a Bank class would be the solution I would use.

One dilemma I regularly face is the length of method and variable names. In this peice of work I have chosen to keep my naming as descriptive as possible in order to make the code legible. I appreciate that this does, on occasion sacrifice brevity.

## <a name="setup">Setup and Demo</a>

### Setup

* Clone this repository to your machine using the green link above
* Migrate into the repository
* Run `bundle install` to install all dependencies
* Check that all tests are passing by running `rspec`
* Load IRB by typing `irb` into your teminal

### Demo

Once you are in IRB you should be able to use the following steps to interact:

```
2.4.1 :001 > require './lib/account'
 => true
2.4.1 :002 > account = Account.new
 => #<Account:0x00000000a81b28 @balance=0, @transaction_history_view=#<TransactionHistoryView:0x00000000a81ab0 @transaction_history_instance=#<TransactionHistory:0x00000000a81
a88 @transaction_class=Transaction, @all_transactions=[]>>>
```

You will now be able to add funds to your account:

```
2.4.1 :003 > account.add_funds(1000)
 => [#<Transaction:0x00000000a71200 @balance=1000, @credit=1000, @debit=0, @date="2018-01-02">]
2.4.1 :004 > account.balance
 => 1000
```

And spend your hard earned money:

```
2.4.1 :005 > account.remove_funds(300)
 => [#<Transaction:0x00000000a71200 @balance=1000, @credit=1000, @debit=0, @date="2018-01-02">, #<Transaction:0x00000000a5b8b0 @balance=700, @credit=0, @debit=300, @date="2018
-01-02">]
2.4.1 :006 > account.balance
 => 700
```
But you wont be able to withdraw more than you have in the account:

```
2.4.1 :007 > account.remove_funds(3000)
RuntimeError: You have insufficient funds
        from /home/lewis/Repositories/Makers_Academy/10_Week/bank_tech_test/lib/account.rb:22:in `remove_funds'
        from (irb):7
        from /usr/share/rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
```

Or credit with a negative value:

```
RuntimeError: You can't credit a negative value
        from /home/lewis/Repositories/Makers_Academy/10_Week/bank_tech_test/lib/account.rb:16:in `add_funds'
        from (irb):8
        from /usr/share/rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'
```

Finally, you can view all the transactions that you have made along with the date they were made and the resulting balance:

```
2.4.1 :009 > account.print_statement
date || credit || debit || balance
2018-01-02 || 1000 || 0 || 1000
2018-01-02 || 0 || 300 || 700 => nil
```

## <a name="technologies">Technologies</a>

This program has been written using Ruby version 2.4.1. It's development was entirely test driven using the RSpec testing framework. Uniform code formatting has been achieved using Rubocop.
