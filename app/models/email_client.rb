require 'mail'

class EmailClient

  def self.setup
    begin
      Mail.defaults do
        delivery_method :smtp, {
          :address => ENV['smtp_server'],
          :port => ENV['smtp_server_port'],
          :domain => ENV['email_domain'],
          :user_name => ENV['email_username'],
          :password => ENV['email_password'],
          :authentication => 'plain',
          :enable_starttls_auto => true
        }
      end
    rescue => e
      puts e
    end
  end

  def self.send_email(email, username, message)

    message = 

    mail = Mail.new do
      from "#{ENV['email_username']}@#{ENV['email_domain']}"
      to username
      subject "You've been mentioned on Chitter"
      body message
    end

    mail.deliver

  end
end
