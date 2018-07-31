class Show < ActiveRecord::Base
  has_many :views
  has_many :users, through: :views

  def shows_by_genre(genre)
    Show.where(genre: genre)
  end
end
