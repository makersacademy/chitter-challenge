class Mailer
  def initialize (email, peep, mailgun_class)
  	@email, @peep, @mailgun_class = email, peep, mailgun_class
  end

  def self.mail(email, peep, mailgun_class = Mailgun)
  	new(email, peep, mailgun_class).mail
  end

  def mail
  	@mailgun_class.new.messages.send_email(
  		email: @email,
  		subject: 'Notification from Chitter',
  		peep: "You were mentioned in a peep from #{@peep.user.username}, on #{@peep.time}: #{@peep.peep}",
  		from: 'automessager@chitter.peep'
  		)
  end

end