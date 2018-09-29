class FeedbacksMailer < ApplicationMailer
  def send_feedback(params, current_user)
    @body = params[:body]

    mail to: Admin.admin_email, subject: t('feedbacks.feedback_subject', user: current_user.name)
  end
end
