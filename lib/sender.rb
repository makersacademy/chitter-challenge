require 'pony'
require 'user'

class Sender

  def self.send_email(peep)

    peep.valid_tags.each do |tag|
      recipient = User.find_from_username(tag)
      to = recipient.email
      subject = "You have been tagged in a peep by"
      subject += " #{User.find(peep.user_id).username}"
      body = "You have been tagged in a peep by "
      body += "#{User.find(peep.user_id).username}\n#{peep.message}"

      Pony.mail(:to => "#{to}", :from => "Chitter",
        :subject => "#{subject}", :body => "#{body}")
    end

  end
end
