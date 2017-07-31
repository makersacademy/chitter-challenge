require 'mailgun'

class Mailer
  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['MAILGUN_DOMAIN_NAME'], {
      from: "Chitter Mail <postmaster@#{ENV['MAILGUN_DOMAIN_NAME']}>",
      to: user.email,
      subject: "You have been tagged in a Peep",
      text: "You have been tagged in a Peep" })
    end

  private
  attr_reader :mailer
end
