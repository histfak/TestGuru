module QuestionsHelper
  def question_header(mode)
    if mode == 'edit'
      render inline: '<h1>Edit \"<%= @question.body %>\" question</h1>'
    elsif mode == 'create'
      render inline: '<h1>Create a new question</h1>'
    end
  end
end
