class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :questions, dependent: :destroy
  has_many :test_attempts, dependent: :destroy
  has_many :users, through: :test_attempts, dependent: :destroy

  class << self
    def by_category(category = '')
      joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
    end
  end
end
