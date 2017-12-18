require 'mailgun-ruby'
class Mailer
  def initialize (email, peep, mailgun_client)
  	@email, @peep, @mailgun_client = email, peep, mailgun_client
  end

  def self.mail(email, peep, mailgun_client = Mailgun::Client)
  	new(email, peep, mailgun_client).mail
  end

  def mail
  	@mailgun_client.new(ENV['MAILGUN_API_KEY']).send_message(
  		email: @email,
  		subject: 'Notification from Chitter',
  		peep: "You were mentioned in a peep from #{@peep.user.username}, on #{@peep.time}: #{@peep.peep}",
  		from: 'automessager@chitter.peep'
  		)
  end

end