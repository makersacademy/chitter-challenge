require 'mailgun'
class RecoveryLink

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV["key-5d43c10a85ab55067bfcb9053c3fea24"])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV["mailgun_domain_name"], { from: "chitter@mail.com",
        to: user.email,
        subject: "reset your password",
        text: "click here to reset your password http://ilarne-chitter.heroku.com/reset_password?token=#{user.password_token}" })
  end

 private
  attr_reader :mailer
end
