class Account < ActiveRecord::Base
  has_many :users


  def add_user(username)
    User.create(username: username, account_id: self.id)
  end

  def get_users
    User.find_by(account_id: self.id)
  end


  def self.validate_card(cc)
    cc_array = cc.split("")
    total = 0
    no_spaces = cc_array.each do |number|
      if number != " "
        total += number.to_i
      end
    end

    total % 10 == 0
  end
  #
  def self.login(email)
    Account.all.each do |account|
      if account.email == email
        return account
      end
    end

    return "Account not found. Please create an account."
  end

  def self.new_account(email, password, cc, username)
    new_account = Account.create(email: email, password: password, cc: cc)
    new_user = User.create(username: username, account_id: new_account.id)
    return [new_account, new_user]
  end
  #
  # def change_password(new_password)
  #
  # end

  def self.validate_password(password)
    password.length >=6
  end

  def display_users
    self.users.each do |user|
      puts user.username
      puts ""
    end
  end

end
