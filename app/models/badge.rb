class Badge < ApplicationRecord
  belongs_to :badge_type
  belongs_to :category, optional: true
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  def first_time(user)
    user_badges.where(user: user).order(created_at: :asc).first&.created_at
  end
end
