class Admin::AnswersController < Admin::AdminController
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_question_path(@answer.question), notice: t('services.answer_created')
    else
      render :new
    end

  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def rescue_with_record_not_found
    render plain: 'Unable to find the record!'
  end
end
