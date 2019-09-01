require 'mailjet'
require 'dotenv/load'

class Mailer

  def self.setup
    Mailjet.configure do |config|
      config.api_key = ENV['MJ_APIKEY_PUBLIC']
      config.secret_key = ENV['MJ_APIKEY_PRIVATE']
      config.api_version = 'v3.1'
    end
  end

  def self.send(email)
    Mailjet::Send.create(messages: [{
      'From'=> {
        'Email'=> ENV['SENDER_EMAIL'],
        'Name'=> 'Chitter'
      },
      'To'=> [
        {
          'Email'=> email.to_email,
          'Name'=> email.to_name
        }
      ],
      'Subject'=> email.subject,
      # 'TextPart'=> 'My first Mailjet email',
      'HTMLPart'=> email.body,
      # 'CustomID' => 'AppGettingStartedTest'
    }]
    )
  end
end
