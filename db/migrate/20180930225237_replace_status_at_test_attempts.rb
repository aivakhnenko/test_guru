class ReplaceStatusAtTestAttempts < ActiveRecord::Migration[5.2]
  def change
    change_table :test_attempts do |t|
      t.remove :status
      t.integer :correct_questions, default: 0
      t.references :current_question, foreign_key: { to_table: :questions }
    end
  end
end
