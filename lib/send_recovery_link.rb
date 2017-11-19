require 'mailgun-ruby'
require 'dotenv/load'

class SendRecoveryLink
  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['MAILGUN_DOMAIN'], {from: "chitter@mail.com",
      to: user.email,
      subject: "Reset your password",
      text: "Click here to reset your password https://afternoon-inlet-98969.herokuapp.com/reset_password?token=#{user.password_token}"
    })
  end

  private
  attr_reader :mailer
end
