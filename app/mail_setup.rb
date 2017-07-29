require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    address: "smtp.gmail.com",
    port: 587,
    user_name: ENV['CHITTER_GMAIL_USERNAME'],
    password: ENV['CHITTER_GMAIL_PASSWORD'],
    authentication: :plain,
    enable_starttls_auto: true
  }
end
