class Test < ApplicationRecord
  def self.find_by_category(category)
    where(category_id: Category.find_by(title: category).id).order(title: :desc).pluck(:title)
    # or
    # joins('JOIN categories ON (tests.category_id = categories.id)').where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
