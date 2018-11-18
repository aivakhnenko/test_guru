class Badge < ApplicationRecord
  enum badge_type: [
    'Test passed after one attempt', 
    'All tests of category are passed', 
    'All tests of level are passed'
  ]
  belongs_to :category, optional: true
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  def first_time(user)
    user_badges.where(user: user).minimum(:created_at)
  end
end
