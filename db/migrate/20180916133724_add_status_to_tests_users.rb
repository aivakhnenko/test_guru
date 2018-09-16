class AddStatusToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tests_users, :status, :integer, default: 0, null: false
  end
end
