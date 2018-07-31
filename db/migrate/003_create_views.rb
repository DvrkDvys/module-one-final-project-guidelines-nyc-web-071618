class CreateViews < ActiveRecord::Migration[4.2]

  def change
    create_table :views do |t|
      t.integer :user_id
      t.integer :show_id
      t.datetime :view_time
    end
  end
end
