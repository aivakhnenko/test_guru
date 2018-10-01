class ReplaceStatusAtTestAttempts < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_attempts, :status, :integer
    add_reference :test_attempts, :current_question, foreign_key: true
    add_column :test_attempts, :correct_questions, :integer, default: 0
  end
end
