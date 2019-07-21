require 'sendgrid-ruby'
include SendGrid

class Send

  def self.email(user_email)
    from = Email.new(email: 'test@example.com')
    to = Email.new(email: "#{user_email}")
    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: 'Hello chicken lamb. You have been tagged in a peep! login to see who it was (because cook knows how to tell you who it is).')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

end