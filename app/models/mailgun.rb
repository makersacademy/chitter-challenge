require 'mailgun'

#rubocop: disable all
def send_token email, token
  RestClient.post "https://api:key-31c0f24a94e1a347c0cff2e46d62f85a"\
  "@api.mailgun.net/v3/sandbox295e4b301ebe4b9eb711aeb9f8943885.mailgun.org/messages",
  from: "Mailgun Sandbox <postmaster@sandbox295e4b301ebe4b9eb711aeb9f8943885.mailgun.org>",
  to: email,
  subject: "Hello Ed OBrien",
  text: "You can reset your password here: http://localhost:9292/reset_password/#{token}"
end
