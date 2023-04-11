require 'action_mailer'

class Emailer < ActionMailer::Base
  def peeped  (message)
    mail(subject:"You got Peeped",
         to:message[:email],
         from:"peep@peep.com",
         body:"message[:message]")
  end
end