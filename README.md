# Writing Dynamic Programs

## Learning Goals

+ Write a case statement
+ Recognize the comment character
+ Compare running a Ruby file versus using IRB
+ Run a Ruby program in the Learn In-Browser IDE
+ Write an if...end statement
+ Write an if...else...end Statement
+ Write an if...elsif...else...end Statement
+ Use puts statement to send content to the screen
+ Use puts statement to send content to the screen
+ Add a comment to code
+ Comment-Out code
+ Provide the command to run a file through Ruby
+ Translate a case statement from if...elsif...else...end
+ Define a statement versus an expression
+ Identify the nil value and its purpose
+ Use statement modifiers to change default sequence

## Outline

This video should cover writing our first application. Should get input from a user, and conditionally print something to the screen.

Tell the user that we're going to run it a lot - sometimes, we won't see what we're hoping to see, but we'll do a lot of testing for ourselves. 

+ In this video, we'll write an application to calculate additional fees for a rental car.
+ If you've ever rented a car, you'll know it's easy to get hit with additional fees.
+ We'll simplify the rules a bit for our purposes. Let's say that the following is true:
  + If you're under 21, you can't rent a car at all.
  + If you're over 21, you can rent with a $20 additional fee per day
    + If you're in Michigan or NY, you also pay a state flat fee of $25 dollars
  + If you're over 25, you don't pay any additional fees
+ Using those rules, go ahead and pause the video and answer the following questions:
  + What pieces of data will we need from our user?
  + What data can we hard-code into our program?
  + Psuedo-code is writing out the steps our program will take without actually writing code. What might the psuedo code for this program look like?
+ Ready let's take a look?
  + What pieces of data will we need from our user?
    - age, then, if they're between 21 and 25, state and number of days they are renting
  + What data can we hard-code into our program?
    - fees per day, which states charge extra fees, what those fees are
  + Psuedo-code
  ```
  - Greet the user
  - get the user age
  - if age is less than 21
    - tell the user they can't rent
  - if the age is over 25
    - tell them they can rent with no fee
  - otherwise
    - ask their state and how many days they are renting
    - set fee to be number of days times fee per day
    - if they are in michigan or ny
      - add state fee
    - tell the user their total fee
  ```
+ Explain that you've written the psuedo-code as a comment - comments are just for the programmer to read, the computer ignores them
  + Ruby programmers try to avoid comments as explanation, but for learning purposes they are great for remembering things
+ Implement the above program. To start, let's print a greeting to the user. We can do this using `puts`, `print`, or `p` - they'll all do slightly different things.
  + print will print our string to the console.
  + puts will add a newline after printing
  + p will print, and also return the value.
  + For now, don't worry too much about the difference between the above. Since I want a newline, we'll go ahead and use `puts`
  + `puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."`
+ We can execute this now using `ruby <FILENAME>` - that tells the ruby interpreter to run all the code in this file.
+ Next, we need to get some input for the user. For this, we can use a method called `gets` - `gets` will go and get a string from the terminal. We can then save that value to a variable.

+ Discuss gets.chomp, and to_i to convert to integer
+ Write out if statements for initial condition
+ Then go for state check - use case statement for this one
  + Maybe write out as an if..elsif first, then show why case is easier to read
+ Run the app - show the user what it does
