class ChangeNameAndTypeAtUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :name
      t.remove :user_type
      t.string :first_name
      t.string :last_name
      t.string :type, null: false, default: 'User'
      t.index :type
    end
  end
end
