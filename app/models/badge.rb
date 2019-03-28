class Badge < ApplicationRecord
  extend Enumerize

  has_many :user_badges, dependent: :delete_all
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: { scope: :rule }
  validates :rule, presence: true
  validates :image, presence: true, format: %r{\A(http|https):\/\/.+\/.+\.(png|jpg|gif)\z}i # I know it's not a good way

  enumerize :rule, in: { first_try: 1, all_tests_in_category: 2, all_tests_of_level: 3 }, predicates: true
end
