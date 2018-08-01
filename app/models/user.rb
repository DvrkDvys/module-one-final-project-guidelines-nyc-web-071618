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

end
