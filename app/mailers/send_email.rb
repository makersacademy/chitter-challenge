require 'mailgun'

class SendEmail

  attr_reader :mailer

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new("key-74ad335f35ad8b2a92c7a77fe7528a8a", "bin@mailgun.net", "a04761ce", ssl=false)
  end

  def self.call(user, mailer=nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['sandboxac3ae1d0afd54bb58f646cdb6ce661a9.mailgun.org'], {
      :from => "Chitter <postmaster@sandboxac3ae1d0afd54bb58f646cdb6ce661a9.mailgun.org>",
      :to => user.email,
      :subject => "Forgotten Password",
      :text => "Please click the following link to change your password: https://chitter-jenna.herokuapp.com/users/reset_password?token=#{user.password_token}"
    })
  end

end
