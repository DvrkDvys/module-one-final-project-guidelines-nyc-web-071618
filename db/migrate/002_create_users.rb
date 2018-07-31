class CreateUsers < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |t|
      t.string :username
      t.integer :account_id
    end
  end
end
