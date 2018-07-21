class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[edit show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    render inline: '<% @test.questions.each { |q| %><p><%= q.body %></p> <% } %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
  end

  def create
    @question = @test.questions.create(question_params)
    render plain: 'Done!'
  end

  def destroy
    @question.destroy
    render plain: 'Done!'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_record_not_found
    render plain: 'Unable to find the record!'
  end
end
