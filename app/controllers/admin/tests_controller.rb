class Admin::TestsController < Admin::AdminController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[edit show update destroy start update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.own_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def rescue_with_record_not_found
    render plain: 'Unable to find the record!'
  end
end
