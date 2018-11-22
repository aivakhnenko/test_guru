class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.integer :badge_type
      t.integer :badge_type_specificator

      t.timestamps
    end
  end
end
