class Admin::QuestionsController < Admin::AdminController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[edit show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question), notice: t('.question_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
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
