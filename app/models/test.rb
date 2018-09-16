class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  class << self
    def by_category(category = '')
       joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
    end
  end
end
