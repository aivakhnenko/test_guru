class ReplaceStatusAtTestAttempts < ActiveRecord::Migration[5.2]
  def change
    change_table :test_attempts do |t|
      t.remove :status, :integer
      t.integer :correct_questions, default: 0
      t.references :current_question, foreign_key: true
    end
  end
end
