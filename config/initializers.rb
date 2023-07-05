require 'mail'

Mail.defaults do
  delivery_method :smtp, { :address              => "localhost",
                           :port                 => 25,
                           :domain               => 'localhost.localdomain',
                           :user_name            => ENV["EMAIL_USERNAME"],
                           :password             => ENV["EMAIL_PASSWORD"],
                           :authentication       => nil,
                           :enable_starttls_auto => true }
end
