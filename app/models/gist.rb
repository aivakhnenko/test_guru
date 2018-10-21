class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def hash
    url[24..55]
  end
end
