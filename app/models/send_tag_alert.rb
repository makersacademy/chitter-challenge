require 'mailgun'

class SendTagAlert

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV["API_KEY"])
  end

  def self.call(email, mailer = nil)
    new(mailer: mailer).call(email)
  end

  def call(email)
    mailer.send_message(ENV["DOMAIN_NAME"], {
       :from => "Mailgun Sandbox " \
       "<postmaster@sandbox525820faaf674cacb7fbe63d187e2983.mailgun.org>",
       :to => email,
       :subject => "You've been tagged in a post!",
       :text => "Hello! You've been tagged in a post. Log in to Chitter to " \
       "see who is talking about you!" })
  end

  private
  attr_reader :mailer
end
