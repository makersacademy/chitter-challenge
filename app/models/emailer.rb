require 'gmail'

module Emailer

  def self.send_tag_email(user)
    subject = "You've Been Tagged In A Peep by @#{user.handle}!"
    body = "#{user.first_name.capitalize} has tagged you in a peep. Log in to Chitter view"
    compose_send_message(user.email, subject, body)
  end

  def self.send_reply_email(user)
    subject = "You Have A Reply From @#{user.handle}!"
    body = "#{user.first_name.capitalize} has responded to your peep. Log in to Chitter view"
    compose_send_message(user.email, subject, body)
  end

  private_class_method

  def self.gmail
    Gmail.connect(ENV['GMAIL_USERNAME'], ENV['GMAIL_PW'])
  end

  def self.compose_send_message(email, subject_text, body_text)
    gmail.deliver do
      to email
      subject subject_text
      text_part { body body_text }
    end
  end

end
