require 'action_mailer'
require 'active_support'

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address        => "smtp.gmail.com",
   :port           => "587",
   :authentication => :plain,
   :user_name      => ENV['CHITTER_EMAIL'],
   :password       => ENV['CHITTER_PASSWORD'],
   :enable_starttls_auto => true
  }

ActionMailer::Base.view_paths= File.dirname(__FILE__)

class Mailer < ActionMailer::Base
  default from: 'admin@chitter.com'

  def notification(recipient)
    @recipient = recipient
    mail(to: recipient['email'],
         subject: "You have been tagged on chitter")
  end
end
