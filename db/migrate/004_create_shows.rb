class CreateShows < ActiveRecord::Migration[4.2]

  def change
    create_table :shows do |t|
      t.string :title
      t.string :genre
      t.integer :episodes
    end
  end
end
