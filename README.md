# Writing Dynamic Programs

## Learning Goals

+ Use conditional logic in a Ruby application
+ Use comments in a Ruby program
+ Run a Ruby program in the Learn In-Browser IDE
+ Use puts statement to send content to the screen

## Lesson

+ Hi guys, it's Ian from Flatiron School. In this video, we're going to write our first Ruby application. Our learning goals for this video:
  + Use conditional logic in a Ruby application
  + Use comments in a Ruby program
  + Run a Ruby program in the Learn In-Browser IDE
  + Use puts statement to send content to the screen
+ We're going to write a real application. This will be a dynamic application - what I mean by that is, depending on what the user inputs, they'll see different content.
+ This will be a command line application that takes in some inputs from a user, and gives them some information back based on what they enter.
+ We're going to run the application a lot - sometimes, we won't see what we're hoping to see, but we'll do a lot of testing for ourselves.
+ This is an important part of the development process - always test our your code to see if it's working!
+ So, we're going to write an application to calculate additional fees for a rental car.
+ If you've ever rented a car, you'll know it's easy to get hit with additional fees.
+ In real life, there are many different reasons why you might have to pay a fee for a rental car. Many rental agencies have age restrictions, late fees, etc.  
+ For our purposes, we'll simplify the rules a bit. Let's say that the following is true for our program:
  + If you're under 21 years old, you can't rent a car at all.
  + If you're over 21, you can rent with a $20 additional fee per day
    + If you're in NY, you also pay a state flat fee of $25 dollars
    + If you're in MI, you also pay a flat fee of $20
  + If you're over 25, you don't pay any additional fees
+ Using those rules, go ahead and pause the video and answer the following questions:
  + What pieces of data will we need from our user?
  + What data can we hard-code into our program?
+ Ready? Let's take a look.
+ To answer the first question, what pieces of data will we need from our user?
+ The fee is based on three things - the age of the renter, and what state they live in, and how many days they are travelling for. So we'll need to collect that info from them.
+ What data can we hard-code into our program?
+ Fee per day is always $20, so we can hard code that. We can also store which states charge extra fees, and how much those fees are.
+ Fun fact - we'll simply store this data in our code. In real life, you might have a database or something where you stored this information and read from it, but for now this will work well.
+ So let's talk for a second about pseudocode.
+ Pseudocode is the process of writing out the steps our program will take without actually writing code.
+ The step-by-step should be very detailed, but doesn't have to be syntactically accurate. So, it doesn't need to actually run.
+ What might the pseudo code for this program look like?
+ Ready let's take a look?
+ Here's one way you might pseudocode this out. I'm going to write this for now as a comment - comments are just notes for humans to read, they are ignored by the interpreter.
+ They are really useful for when we're starting out and learning - later on, we'll learn how to minimize comments to make our code more readable, but for now this will be great.
+ So here is my pseudo-code:
+ Pseudocode
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
  - if they are in michigan
    - add 20
  - if they are in NY
    - add 25
  - tell the user their total fee
```
+ Now, we can go line by line through our pseudocode and implement the above program.
+ To start, let's print a greeting to the user. We can do this using `puts` statement.
+ `puts` will print out a string to the terminal for us.  
+ `puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."`
+ We can execute this now using `ruby <FILENAME>` - that tells the ruby interpreter to run all the code in this file.
+ So let's run this now and make sure that it works - and great, we see the
+ Next, we need to get some input for the user. For this, we can use a method called `gets` - `gets` will go and get a string from the terminal. We can then save that value to a variable.
+ Now, by default, the `gets` method will store every key the user types, including the enter key. So I want to strip that off. For this I like to use the `strip` method - that will remove the enter key, plus any trailing whitespace the user might type in.
+ So let's say `age = gets.strip`
+ If I run this again, we can see that now our program is waiting for the user to type something in. So that's great - I'll type `100` and we're in good shape.
+ And just to make sure that we're getting the age, I'll just print it out right after we get it, so I'll say `puts "age is #{age}"` - that's called string interpolation, so using the pound sign + brackets, we can put that variable into our string. So if I run this again - I can see that the age is printing. Ok, great!
+ So next, we can add a conditional to say that if the age is less than 21, you can't rent a car. So let's add that logic now. I'll also use a variable called `minimum_rental_age` to help clarify why you can't rent if you're under 21
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
end
```
+ So let's run this now - and we see an error. Cool! Let's read it and see what's wrong. So it says "comparison of String with 21 failed (ArgumentError)" So we're trying to compare a string with a number, and that's because when we use `gets`, it's going to take in what the user types as a String, not as a number. So we need to convert that string into a number when we take in the value. We can do that using `to_i` - this method will convert a string into an integer.
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip.to_i
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
end
```
+ Great - if we run this now, and enter 20 as our age - awesome, we see our message. And if we run again and enter 100, we see nothing. Great.
+ Now, let's add our condition for if the user is over 25. In that case, we want to tell the user they can rent for no additional fee. I'll do this one pretty quickly using elsif.
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip.to_i
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
elsif age >= 25
  puts "You can rent without any additional fees!"
end
```
+ Run this now and type in 100 - great, we see that we can rent for no additional fees if we're 100 years old. If you're 100 years old and can drive, good for you - they should give you the car for free.
+ Anyway, finally let's figure out what happens if the user is between 21 and 25. So we have our initial two cases covered, so we can make this last one our else case - either the user is less than 21, over 25, or else in between.
+ So next in our pseudocode, let's ask how many days they are renting for, and let's remember to turn this one into an integer as well.
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip.to_i
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
elsif age >= 25
  puts "You can rent without any additional fees!"
else
  puts "How many days will you be renting a car?"
  days_renting = gets.strip.to_i
end
```
+ Great, now we can calculate the additional fee using multiplication. So we'll say fee_per_day = 20, and then the fee equals fee_per_day times day renting
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip.to_i
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
elsif age >= 25
  puts "You can rent without any additional fees!"
else
  puts "How many days will you be renting a car?"
  days_renting = gets.strip.to_i
  fee_per_day = 20
  fee = fee_per_day * days_renting
  puts "You will owe $#{fee}"
end
```
+ So we're really close - finally, we need to add a check for the state, because if they are in MI or NY, those states each charge different flat fees per rental
+ So let's ask for the state of the user.
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip.to_i
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
elsif age >= 25
  puts "You can rent without any additional fees!"
else
  puts "How many days will you be renting a car?"
  days_renting = gets.strip.to_i
  fee_per_day = 20
  fee = fee_per_day * days_renting
  puts "Please enter your two digit state code"
  state = gets.strip
  puts "You will owe $#{fee}"
end
```
+ Now, you might be asking yourself at this point "Hey, shouldn't we validate all of this user input? What happens if the user makes a typo or something."
+ That's definitely a valid concern, but to start out I want to get this working assuming that the user does everything correctly. So we're going to pretend that the user always types the right thing just to get something up and going.
+ If we were going to build this out further, we could add some checks to make sure they entered this in correctly.
+ Anyway, I could write this out using an if/elsif statement like so
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip.to_i
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
elsif age >= 25
  puts "You can rent without any additional fees!"
else
  puts "How many days will you be renting a car?"
  days_renting = gets.strip.to_i
  fee_per_day = 20
  fee = fee_per_day * days_renting
  puts "Please enter your two digit state code"
  state = gets.strip
  if state == "MI"
    fee += 20
  elsif state == "NY"
    fee += 25
  end
  puts "You will owe $#{fee}"
end
```
+ This will totally work, but might actually read more easily using a case statement. Case statements work similarly to if statements, just have a slightly different syntax.
```ruby
puts "Welcome to the Rental Car Fee Checker! To begin, please enter your age."
age = gets.strip.to_i
minimum_rental_age = 21
if age < minimum_rental_age
  puts "Sorry, you are too young to rent a car"
elsif age >= 25
  puts "You can rent without any additional fees!"
else
  puts "How many days will you be renting a car?"
  days_renting = gets.strip.to_i
  fee_per_day = 20
  fee = fee_per_day * days_renting
  puts "What state will you be renting in?"
  state = gets.strip
  case state
  when "MI"
    fee += 20
  when "NY"
    fee += 25
  end
  puts "You will owe $#{fee}"
end
```
+ So pretty similar - slightly less repetitive. But let's run this now, and enter in 24, and we'll say we are renting for 3 days in NY...
+ And - great! We see that we owe $85. So this works great
+ Now, at this point there's a lot we could do to make this code more readable - we could use methods to break this up a bit, but this totally works.
+ So, remember, I was able to get this up and running pretty quickly, but I've been doing this for a long time. So if you get a problem like this, make sure to take your time, break down the requirements like we did in the beginning, and implement them one at a time.
+ That's all for this one - just to recap our learning goals:
  + We looked at how to run a file in Ruby and compared that to using IRB
  + We used tons of conditional logic in our Ruby application
  + We used comments in a Ruby program, for pseudocode
  + And we used a puts statement to send content to the screen, and a gets statement to get input from our user
+ Thanks for watching, and happy coding!
