class CreateTestAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :test_attempts do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
