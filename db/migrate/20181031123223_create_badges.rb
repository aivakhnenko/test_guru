class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.references :badge_type, foreign_key: true, null: false
      t.references :category, foreign_key: true
      t.integer :level, foreign_key: true

      t.timestamps
    end
  end
end
