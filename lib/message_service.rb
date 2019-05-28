# TO DO: Test

require 'pony'
require 'dotenv'

class Email
  
  Dotenv.load('emailer.env')

  def self.send(email, sender)
    Pony.mail({
    :from => "Chitter",
    :to => "#{email}",
    :subject => "Mention on Chitter",
    :body => "Hi there, Just letting you know you have been mentioned on Chitter by #{sender}",
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['user'],
      :password             => ENV['pass'],
      :authentication       => :plain, 
      :domain               => "localhost.localdomain" 
    }
    })
  end

end
