class AddTimer < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer, default: 0
    add_column :test_attempts, :start_time, :datetime
  end
end
