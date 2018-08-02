class Account < ActiveRecord::Base
  has_many :users


  def add_user(username)
    User.find_or_create_by(username: username, account_id: self.id)
  end

  def get_users
    User.find_by(account_id: self.id)
  end

  def self.validate_card(cc)
    cc_array = cc.split("")
    total = 0

    no_spaces = cc.select do |char|
      char != " "
    end

    if no_spaces.length == 16
      no_spaces.each do |number|
          total += number.to_i
      end
    else
      puts "Card invalid. Please reenter"
      cc_again = gets.chomp
      self.validate_card(cc_again)
    end

    total % 10 == 0
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

  # def change_password(new_password)
  #
  # end

  def display_users
    puts ""
    self.users.each do |user|
      puts user.username
      puts ""
    end

    puts "*" * 60
  end
end
