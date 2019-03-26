class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: { scope: :rule }
  validates :rule, presence: true
  validates :image, presence: true, format: { with: %r{\Ahttp:\/\/.+\/.+\.(png|jpg|gif)\z}i, on: :create}
end
