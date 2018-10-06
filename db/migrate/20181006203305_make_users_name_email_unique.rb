class MakeUsersNameEmailUnique < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.index :name, unique: true
      t.index :email, unique: true
    end
  end
end
