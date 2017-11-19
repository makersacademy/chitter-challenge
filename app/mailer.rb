require 'mailgun'
require_relative '../credentials.rb'

class TagBossMan
  def self.call(user, peep, peep_user)
    @mg_client = Mailgun::Client.new API_KEY
    message_params =  { from: SENDER,
                      to:   user.email,
                      subject: 'Tagged',
                      text:    "#{peep_user.username} has tagged you in the following peep:\n#{peep.content}\n"
                    }
    @mg_client.send_message DOMAIN, message_params
  end
end
