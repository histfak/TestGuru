module TestPassagesHelper
  def result_style(test_passage)
    test_passage.success? ? 'success' : 'fail'
  end
end
