class Show < ActiveRecord::Base
  has_many :views
  has_many :users, through: :views

<<<<<<< HEAD
  def self.display_shows
    Show.all.each do |show|
      puts show
      puts ""
    end
  end

=======
  def shows_by_genre(genre)
    Show.where(genre: genre)
  end
>>>>>>> 14b045ca59e3624c210badb6fc3fad5c621927d2
end
