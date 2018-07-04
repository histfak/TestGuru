class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key(:tests, :categories)
    add_foreign_key(:questions, :tests)
    add_foreign_key(:answer, :questions)
  end
end
