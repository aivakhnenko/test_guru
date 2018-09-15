class User < ApplicationRecord
  def tests(level)
    Test.joins('JOIN test_attempts ON tests.id = test_attempts.test_id JOIN users ON test_attempts.user_id = users.id').where("tests.level = :level AND users.id = :id", level: level, id: id)
  end
end
