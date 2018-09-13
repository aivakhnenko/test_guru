class AddTablesPropertiesNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :category, false)
    change_column_null(:question, :body, false)
    change_column_null(:question, :test_id, false)
    change_column_null(:answer, :text, false)
    change_column_null(:answer, :correct, false)
    change_column_null(:answer, :question_id, false)
    change_column_null(:user, :name, false)
    change_column_null(:user, :type, false)
    change_column_null(:category, :title, false)
  end
end
