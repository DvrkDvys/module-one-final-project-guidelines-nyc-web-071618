class User < ActiveRecord::Base
  belongs_to :account
  has_many :views
  has_many :shows, through: :views
end
