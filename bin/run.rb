require_relative '../config/environment'
require 'pry'

puts "Welcome to Netflix!"
puts "Please input your email:"
email = Account.validate_email(gets.chomp)
puts "Please input your password:"
password = Account.validate_password(gets.chomp)



account = Account.login(email, password)

if account.class == String
  puts account
  puts "Set your password. Must be at least 8 characters long."
  password = Account.validate_password(gets.chomp)
  puts "Enter a valid credit card"
  cc = Account.validate_card(gets.chomp)

  puts "Account successfully created! Please provide a username."
  username = Account.validate_username(gets.chomp)
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
    user = User.find_by(username: username)
  end
end

def menu
  puts ""
  puts "Select your number of choice:"
  puts "1: View shows"
  puts "2: Watch show"
  puts "3: Get recommendations"
  puts "4: View by genre"
  puts "5: Switch user"
  puts "6: Create user"
  puts "7: Logout"
  choice = gets.chomp
  return choice
end

def view_shows
  puts "Select a show!"
  Show.display_shows
end

def watch_a_show(user)
  Show.display_shows
  puts ""
  puts "Please choose title"
  puts ""
  show_choice = gets.chomp
  if Show.find_by(title: show_choice) == nil
    puts "Invalid show title!"
  else
    user.watch(show_choice)
    puts ""
    puts "You just watched #{show_choice}!"
    puts ""
  end
end

def switch_user(account)
  puts "Please choose a username"
  account.display_users
  username = gets.chomp
  user = User.find_by(username: username)
  if user == nil
    puts "Invalid user!"
    switch_user(account)
  end
end

def create_user(account)
  puts "Please choose a username"
  username = gets.chomp
  user = User.find_or_create_by(username: username, account_id: account.id)
  puts "*Please logout and log back in if new user not found*"
  return user
end

def display_by_genre
  Show.display_genres
  puts ""
  puts "Please choose the genre you'd like to view."
  puts ""
  genre_choice = gets.chomp
  Show.shows_by_genre(genre_choice)
end

def get_recommendations(user)
  unseen_shows = user.recommend
  if unseen_shows == []
   puts  "Nothing to recommend yet!"
    return
  end

  puts ""
  puts "We recommend the following shows:"
  puts ""

  unseen_shows.each do |show|
    puts show.title
  end

  puts "*" * 60
  puts ""
  puts "Which show would you like to watch?"
  show_choice = gets.chomp.downcase
  user.watch(show_choice)
  puts ""
  puts "You just watched #{show_choice}!"
  puts ""
end

menu_choice = menu

until menu_choice == "7" do
  if menu_choice == "1"
    view_shows
  elsif menu_choice == "2"
    watch_a_show(user)
  elsif menu_choice == "3"
    get_recommendations(user)
  elsif menu_choice == "4"
    display_by_genre
  elsif menu_choice == "5"
    switch_user(account)
  elsif menu_choice == "6"
    user = create_user(account)
  else
    puts "Invalid choice. Please try again!"
  end
  menu_choice = menu
end

puts ""
puts "Goodbye!"
puts ""


binding.pry
0
