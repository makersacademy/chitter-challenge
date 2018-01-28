require 'mailgun-ruby'

class ChitterMailer
  attr_reader :mailer

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['MY_API_KEY'])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['MAILGUN_DOMAIN_NAME'], {from: "chittermailer@mail.com",
      to: user.email_address,
      subject: "You have successfully registered",
      text: "Thank you for registering with Chitter, your username is #{user.username}"})
    end
end
