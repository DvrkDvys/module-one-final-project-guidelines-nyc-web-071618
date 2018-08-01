class Show < ActiveRecord::Base
  has_many :views
  has_many :users, through: :views

  def self.display_shows
    Show.all.each do |show|
      puts show
      puts ""
    end
  end

end
