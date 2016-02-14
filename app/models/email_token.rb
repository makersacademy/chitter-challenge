require 'dotenv'
Dotenv.load
require 'mailgun'
class EmailToken

 def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(ENV['API'])
 end

 def self.call(user, mailer = nil)
   new(mailer: mailer).call(user)
 end

 def call(user)
   p user.email
   p user.password_token
   message_params = {from: "help@chitterbot.com",
                     to: user.email,
                     subject: "reset your password",
                     text: "click here to reset your CHITTER password http://alexavlonitis-chitter.herokuapp.com/token/#{user.password_token}"}
   mailer.send_message(ENV["DOMAIN"], message_params)
 end

 private
 attr_reader :mailer
end
