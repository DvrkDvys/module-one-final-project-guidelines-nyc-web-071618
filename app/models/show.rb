class Show < ActiveRecord::Base
  has_many :views
  has_many :users, through: :views

  def self.display_shows
    puts ""
    puts "You can watch any of the following shows:"
    puts ""

    Show.all.each do |show|
      puts show.title
    end

    puts "*" * 60
  end

  def self.display_genres
      genres = []
      puts "We have the following genres:"
      puts ""
      Show.all.each do |show|
        genres << show.genre
      end
      genres = genres.uniq

      genres.each do |genre|
        puts genre
      end

    end

    def self.shows_by_genre(genre)
      puts ""
      puts "We have the following shows in the #{genre} genre:"
      puts ""
      shows = Show.where(genre: genre)
      shows.each do |show|
        puts show.title
        puts ""
      end
    end

end
