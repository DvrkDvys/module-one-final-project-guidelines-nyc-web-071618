class User < ActiveRecord::Base
  belongs_to :account
  has_many :views
  has_many :shows, through: :views

  def get_show(title)
    Show.find_by(title: title)
<<<<<<< HEAD
  end

  def watch(title)
    show = get_show(title)
    View.create(user_id: self.id, show_id: show.id, view_time: DateTime.now)
  end

  def shows
    self.views.map do |view|
      Show.find_by(id: view[:show_id])
    end.uniq
=======
>>>>>>> 14b045ca59e3624c210badb6fc3fad5c621927d2
  end

  def watch(title)
    x = get_show(title)
    View.create(user_id: self.id, show_id: x.id, view_time: DateTime.now)
  end

  def shows
    self.views.map do |view|
      Show.find_by(id: view[:show_id])
    end.uniq
  end
end
