require 'mail'
require 'email_server_settings'

class EmailClient

  def self.setup
    Mail.defaults do delivery_method(:smtp, {
        :address => ENV['smtp_server'],
        :port => ENV['smtp_server_port'],
        :domain => ENV['email_domain'],
        :user_name => ENV['email_username'],
        :password => ENV['email_password'],
        :authentication => 'plain',
        :enable_starttls_auto => true
      })
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
