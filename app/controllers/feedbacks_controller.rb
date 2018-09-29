class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    FeedbacksMailer.send_feedback(params, current_user).deliver_now
    redirect_to root_path, notice: t('feedbacks.feedback_sent')
  end
end
