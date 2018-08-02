class Account < ActiveRecord::Base
  has_many :users

  def add_user(username)
    User.find_or_create_by(username: username, account_id: self.id)
  end

  def get_users
    User.find_by(account_id: self.id)
  end

  def self.validate_email(email)
    if email.length < 2 || email.include?(" ")
      puts "Please use a valid email"
      email_again = gets.chomp
      self.validate_email(email_again)
    else
      return email
    end
  end

  def self.validate_password(password)
    if password.length < 8 || password.include?(" ")
      puts "Password must be at least 8 characters & contain no spaces"
      password_again = gets.chomp
      self.validate_password(password_again)
    else
      return password
    end
  end

  def self.validate_card(cc)
    if cc.length < 16 || cc.scan(/\D/) == false
      puts "Card must be at least 16 digits"
      cc_again = gets.chomp
      self.validate_card(cc_again)
    else

    cc_array = cc.split("")
    no_spaces = cc_array.select do |char|
      char != " "
    end

      int = no_spaces.map do |number|
        number.to_i
      end
    total = int.reduce(0, :+)
    if total % 10 == 8
      return cc
    else
      puts "Card invalid. Please reenter"
      cc_again = gets.chomp
      self.validate_card(cc_again)
      return cc_again
      end
    end
  end

  def self.validate_username(username)
    if username.length < 4 || username.include?(" ")
      puts "Username must be at least 4 characters & contain no spaces"
      username_again = gets.chomp
      self.validate_username(username_again)
    else
      return username
    end
  end

  def self.no_account
    puts ""
    puts "Account not found:"
    puts "1: Try Again?"
    puts "2: Create new account?"
    choice = gets.chomp
    if choice == "1"
      puts "Welcome to Netflix!"
      puts "Please input your email:"
      email = gets.chomp
      puts "Please input your password:"
      password = gets.chomp
      self.login(email, password)
    elsif choice == "2"
      return "Thank you for joining Netflix"
    else
      puts "Invalid"
      self.no_account
    end
  end

  def self.login(email, password)
    Account.all.each do |account|
      if account.email == email && account.password == password
        return account
      end
    end
    self.no_account
  end

  def self.new_account(email, password, cc, username)
    new_account = Account.create(email: email, password: password, cc: cc)
    new_user = User.create(username: username, account_id: new_account.id)
    return [new_account, new_user]
  end

  def display_users
    puts ""
    self.users.each do |user|
      puts user.username
      puts ""
    end

    puts "*" * 60
  end
end
