require "dotenv"
require "pony"
require_relative './database_connect'

class EmailNotice

  extend DatabaseConnect

  def self.check_peep(peep, current_user_name)
    result = database_connect.exec("SELECT user_name, email FROM users;")
    result.each do |user|
      if peep.include? "##{user.values[0]}"
        return send_email_alert(user.values[1], current_user_name, peep) # tagged users email and the user name of the tagger
      end
    end
    nil
  end

  def self.send_email_alert(user_email, current_user_name, peep)
    Pony.mail({
      :to => user_email,
      :subject => "You've been PEEPED!",
      :body => "#{current_user_name} has peeped you in this message: #{peep}",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => 587,
        :enable_starttls_auto => true,
        :user_name            => ENV['USER_NAME'],
        :password             => ENV['PASSWORD'],
        :authentication       => :plain,
        :domain               => "localhost.localdomain"
      }
    })
  end
end
