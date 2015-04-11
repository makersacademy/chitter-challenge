require 'rest-client'
module SendMail
  def self.send_welcome(email, username)
    RestClient.post "https://api:key-26baf7e4081e85bd129436c997a3eabd"\
    "@api.mailgun.net/v3/"\
    "sandboxa17c13837d2c426"\
    "38807d8585621cf91.mailgun.org/messages",
                    from: "Mailgun Sandbox <"\
    "postmaster@sandboxa17c13837d2c4"\
    "2638807d8585621cf91.mailgun.org>",
                    to: "#{username} <#{email}>",
                    subject: "Hello #{username}",
                    text: "Welcome to Chitter!"
  end
end