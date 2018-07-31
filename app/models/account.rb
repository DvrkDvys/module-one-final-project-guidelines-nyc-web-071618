class Account < ActiveRecord::Base
  has_many :users


  def add_user(username)
    User.create(username: username, account_id: self.id)
  end

  def get_users
    User.find_by(account_id: self.id)
  end



end
