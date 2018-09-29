class FeedbacksMailer < ApplicationMailer
  def send_feedback(params, current_user)
    @body = params[:body]
    @user = current_user.name
    @admin = User.find_by(name: ADMIN)

    mail to: @admin.email, subject: t('services.feedback_subject', user: @user)
  end
end
