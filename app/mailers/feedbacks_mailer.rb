class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.main_admin.email }

  def send_feedback(params, current_user)
    @body = params[:body]

    mail subject: t('feedbacks.feedback_subject', user: current_user.name)
  end
end
