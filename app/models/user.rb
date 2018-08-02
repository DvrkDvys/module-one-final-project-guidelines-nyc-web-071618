class User < ActiveRecord::Base
  belongs_to :account
  has_many :views
  has_many :shows, through: :views

  def get_show(title)
    Show.find_by(title: title)
  end

  def watch(title)
    show = get_show(title)
    View.create(user_id: self.id, show_id: show.id, view_time: DateTime.now)
  end

  def shows
    self.views.map do |view|
      Show.find_by(id: view[:show_id])
    end.uniq
  end

  def most_viewed_genre
    all_viewed_genres = self.shows.map do |show|
      show.genre
    end
    if all_viewed_genres == []
      return []
    end

    uniq_genres = all_viewed_genres.uniq
    most_viewed_genre = ""
    most_viewed_amount = 0

    uniq_genres.each do |genre|
      if all_viewed_genres.count(genre) > most_viewed_amount
        most_viewed_genre = genre
        most_viewed_amount = all_viewed_genres.count(genre)
      end
    end
    return most_viewed_genre
  end

  def recommend
    genre = most_viewed_genre
    if most_viewed_genre == []
      return []
    end

    shows = Show.where(genre: genre)
    unseen_shows = shows.select do |show|
      self.shows.include?(show) == false
    end
    return unseen_shows
  end

end
