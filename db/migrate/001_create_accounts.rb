class CreateAccounts < ActiveRecord::Migration[4.2]

  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password
      t.integer :cc
    end
  end
end
