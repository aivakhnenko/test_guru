class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_attempts, dependent: :destroy
  has_many :users, through: :test_attempts

  class << self
    def by_category(category = '')
      joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
    end
  end
end
