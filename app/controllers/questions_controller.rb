class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question_number, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    render inline: '<% @test.questions.each { |q| %><p><%= q.body %></p> <% } %>'
  end

  def show
    render inline: '<%= @test.questions[@question_number].body %>'
  end

  def new
  end

  def create
    Question.create(params.permit(:body, :test_id))
    render plain: 'Done!'
  end

  def destroy
    @test.questions[@question_number].destroy
    render plain: 'Done!'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question_number
    @question_number = params[:id].to_i - 1
  end

  def rescue_with_record_not_found
    render plain: 'Unable to find the record!'
  end
end
