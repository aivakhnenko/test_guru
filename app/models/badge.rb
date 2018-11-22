class Badge < ApplicationRecord
  enum badge_type: ['one_attempt', 'category', 'level']
  belongs_to :category, optional: true
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  alias_attribute :category_id, :badge_param
  alias_attribute :level, :badge_param

  def first_time(user)
    user_badges.where(user: user).minimum(:created_at)
  end

  def category
    Category.find(category_id) if badge_type == 'category'
  end

  def level
    badge_param if badge_type == 'level'
  end
end
