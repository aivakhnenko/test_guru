class AddTestsLevelDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, from: NULL, to: 0
  end
end
