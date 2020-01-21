require 'mail'
require './email_server_settings.rb'

class EmailClient

  def self.setup

    email_settings = (ENV['ENVIRONMENT'] == 'test' ? {} : EmailSettings::SETTINGS)

    Mail.defaults do delivery_method(:smtp, email_settings)
    end
  end

  def self.send_email(email, username, message)

    mail = Mail.new do
      from "#{ENV['email_username']}@#{ENV['email_domain']}"
      to email
      subject "You've been mentioned on Chitter"
      body message
    end

    begin
      mail.deliver
    rescue => e
      puts e
    end

  end
end
