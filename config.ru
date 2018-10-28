require_relative './app'
require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'chitter.email.todd@gmail.com',
            :password             => 'macbookpro',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }



Mail.defaults do
  delivery_method :smtp, options
end


run ChitterApp
