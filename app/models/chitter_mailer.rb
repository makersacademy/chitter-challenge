require 'mailgun-ruby'
require 'dotenv/load'

class ChitterMailer
  attr_reader :mailer

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['MY_API_KEY'])
  end

  def self.call(user, mailer = nil, mailgun_domain_name =ENV['mailgun_domain_name'])
    new(mailer: mailer).call(user, mailgun_domain_name)
  end

  def call(user, mailgun_domain_name)
    mailer.send_message(mailgun_domain_name, {from: "@mail.com",
      to: user.email_address,
      subject: "You have successfully registered to Chit, let's go!",
      text: "Thank you for registering with Chitter, your username is #{user.username}"})
    end
end
