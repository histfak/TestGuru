class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def calculate
    badges = []
    return [] unless @test_passage.success?
    Badge.all.map { |badge| badges << badge if send("#{badge.rule}?", badge.rule_param) }
    badges
  end

  private

  def successful_tests_uniq_ids
    @successful_tests_uniq_ids ||= @user.test_passages.where(current_question: nil).select(&:success?).map(&:test_id).uniq
  end

  def first_try?(_args)
    @user.tests.where(id: @test.id).count == 1
  end

  def all_tests_of_level?(level)
    return false unless level.to_i == @test.level
    tests_by_level_ids = Test.by_level(level).ids
    (tests_by_level_ids - successful_tests_uniq_ids).empty?
  end

  def all_tests_in_category?(title)
    return false unless title == @test.category.title
    category_tests_ids = Test.by_category(title).ids
    (category_tests_ids - successful_tests_uniq_ids).empty?
  end
end
