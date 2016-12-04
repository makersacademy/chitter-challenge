require "mailgun-ruby"


class MailGun
  attr_reader :client

  def initialize
    @client = Mailgun::Client.new(ENV['MAIL_KEY'])
  end

  def send_token(user)
    client.send_message(ENV['SENDING_DOMAIN'],
                        { from: "chitter@example.com",
                        to:   user.email,
                        subject: "password token",
                        text:    "click here to reset your password http://localhost:9292/users/recover?token=#{user.password_token}"
                      })
  end

end
