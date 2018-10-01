class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <histfak@gmail.com>}
  layout 'mailer'
end
