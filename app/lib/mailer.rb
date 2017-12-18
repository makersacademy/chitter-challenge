require 'mailgun-ruby'
class Mailer
  def initialize (email, peep, mailgun_client)
  	@email, @peep, @mailgun_client = email, peep, mailgun_client
  end

  def self.mail(email, peep, mailgun_client = Mailgun::Client)
  	new(email, peep, mailgun_client).mail
  end

  def mail
  	args = {
  		to: @email,
  		subject: 'Notification from Chitter',
  		text: "You were mentioned in a peep from #{@peep.user.username}, on #{@peep.time}: #{@peep.peep}",
  		from: 'automessager@chitter.peep'
  		}
  	@mailgun_client.new(ENV['MAILGUN_API_KEY']).send_message("sandbox3ee6a72ea9c8425b8d80e6b375006871.mailgun.org", args)
  end

end