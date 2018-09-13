class AddTablesPropertiesNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :category, false)
    change_column_null(:questions, :body, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:answers, :text, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:users, :name, false)
    change_column_null(:users, :type, false)
    change_column_null(:categorys, :title, false)
  end
end
