require 'mailgun'
require 'dotenv'
Dotenv.load

class SendEmail

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['accountKEY'])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['domainNAME'], {from: 'Chitter <mailgun@chitter.com>',
      to: user.email,
      subject: "reset your password",
      text: "click here to reset your password http://localhost:4567/users/reset_password?token=#{user.password_token}"})
  end

  private
    attr_reader :mailer
end
