class AddCompletedSuccessfullyToTestAttempts < ActiveRecord::Migration[5.2]
  def change
    add_column :test_attempts, :completed_successfully, :boolean, default:false
  end
end
