module TestPassagesHelper
  def result_style(test_passage)
    test_passage.success? ? 'success' : 'fail'
  end

  def initial_timer_value(test_passage)
    parts = ActiveSupport::Duration.build(test_passage.time_left).parts
    "#{parts[:minutes]}:#{parts[:seconds].to_i}"
  end
end
