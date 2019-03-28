class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def calculate
    Badge.all.each do |badge|
      add_badge(badge) if send("#{badge.rule}?")
    end
  end

  private

  def add_badge(badge)
    @user.badges << badge
  end

  def successful_tests_uniq_ids
    @user.test_passages.where(current_question: nil).select(&:success?).map(&:test_id).uniq
  end

  def first_try?
    @user.tests.where(id: @test.id).count == 1 if @test_passage.success?
  end

  def all_tests_of_level?
    tests_by_level_ids = Test.where(level: @test.level).ids
    (tests_by_level_ids - successful_tests_uniq_ids).empty?
  end

  def all_tests_in_category?
    category_tests_ids = Category.find_by(title: @test.category.title).tests.ids
    (category_tests_ids - successful_tests_uniq_ids).empty?
  end
end
