class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_attempts, dependent: :destroy
  has_many :users, through: :test_attempts

  validates :title, presence: true, 
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc) }

  def self.titles_by_category(category)
    by_category(category).pluck(:title)
  end
end
