require_relative '../config/environment'
require 'pry'



<<<<<<< HEAD
test1 = Account.create(email: "test1@netflix.com", password: "pword", cc: "4444 4444 4444 4448")

user1 = test1.add_user("user1")
user2 = test1.add_user("user2")
user3 = test1.add_user("user3")

show1 = Show.create(title: "seinfeld", genre: "comedy", episodes: 40)
show2 = Show.create(title: "boondocks", genre: "comedy", episodes: 30)
show3 = Show.create(title: "game of Thrones", genre: "drama", episodes: 50)

View.create(user_id: user1.id, show_id: show1.id, view_time: DateTime.now)
# View.create(user_id: user1.id, show_id: show2.id, view_time: DateTime.now)


puts "Welcome to Netflix!"
puts "Please input your email:"
email = gets.chomp

account = Account.login(email)
user = nil

if account.class == String
  puts account
  puts "Set your password. Must be at least 6 characters long."
  password = gets.chomp
  until Account.validate_password(password) do
    puts "Password not valid. Must be at least 6 characters long."
    password = gets.chomp
  end
  puts "Enter a valid credit card"
  cc = gets.chomp
  until Account.validate_card(cc) do
    puts "Credit card not valid. Please re-enter."
    cc = gets.chomp
  end
  puts "Account successfully created! Please provide a username."
  username = gets.chomp
  account_and_user = Account.new_account(email, password, cc, username)
  account = account_and_user[0]
  user = account_and_user[1]
else
  puts "Choose a user"
  account.display_users
  username = gets.chomp
  user = User.find_by(username: username)
  until user != nil do
    puts "Username not valid. Please try again."
    account.display_users
    username = gets.chomp
  end
end



puts "Select a show!"
Show.display_shows
show_choice = gets.chomp
=======
puts "Welcome to Netflix online."

>>>>>>> 14b045ca59e3624c210badb6fc3fad5c621927d2



binding.pry
0
