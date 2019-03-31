require 'pony'
require 'dotenv'

class Email
  
  Dotenv.load('emailer.env')

  def self.send()
    Pony.mail({
    :from => "Chitter",
    :to => "mirceacosmin@gmail.com",
    :subject => "Mention on Chitter",
    :body => "Hi there, Just letting you know you have been mentioned on Chitter",
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