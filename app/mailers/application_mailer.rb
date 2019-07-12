class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.default_from_email
  layout 'mailer'
end
