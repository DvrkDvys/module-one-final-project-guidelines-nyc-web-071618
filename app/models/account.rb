class Account < ActiveRecord::Base
  has_many :users


  def add_user(username)
    User.create(username: username, account_id: self.id)
  end

  # def login
  #
  # end
  #
  # def validate_card
  #
  # end
  #
  # def change_password(new_password)
  #
  # end
end
