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
