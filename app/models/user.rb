class User < ActiveRecord::Base
  belongs_to :account
  has_many :views
  has_many :shows, through: :views

  def self.add_user(username, account_id)
    User.create(username: username, account_id: account_id)
  end

end
