require 'mail'
require_relative 'models/notification'

unless ENV['MAILTRAP_HOST'].nil?
  Mail.defaults do
    delivery_method :smtp, { :address              => ENV['MAILTRAP_HOST'],
                             :port                 => ENV['MAILTRAP_PORT'],
                             :user_name            => ENV['MAILTRAP_USER_NAME'],
                             :password             => ENV['MAILTRAP_PASSWORD'],
                             :authentication       => :plain,
                             :enable_starttls_auto => true }
  end
else
  Mail.defaults do
    delivery_method :smtp, address: "localhost", port: 1025
  end
end
