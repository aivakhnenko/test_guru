class AddUsersUserTypeDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :user_type, from: nil, to: 0
  end
end
