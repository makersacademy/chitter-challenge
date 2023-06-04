require 'mailgun-ruby'
require_relative 'maker_repository'

class Mentions
  def find(peep)
    /@\S*/ =~ peep.content
    if $~
      return $~.to_s.sub(/@/, '')
    else
      return nil
    end
  end
  
  def send_notification(peep)
    name = self.find(peep)
    to_email = MakerRepository.new.find_by_name(name).email
    mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"], 'api.eu.mailgun.net'
    
    message_params =  { from: ENV["CHITTER_FROM"],
                        to:   to_email,
                        subject: 'Chitter mention',
                        text:    "Someone just Peeped about you: #{peep.content}"
                      }
    if ENV['ENV'] == 'test'
      result = peep
      return result
    end
    
    result = mg_client.send_message ENV["CHITTER_SENDING_DOMAIN"], message_params
    return result
  end
end
