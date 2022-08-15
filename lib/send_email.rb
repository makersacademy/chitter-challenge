require 'sendgrid-ruby'
include SendGrid
require_relative 'peep'

class SendEmail
  def initialize(response, to = ENV['TO_EMAIL'],
      from = ENV['FROM_EMAIL'], api_key = ENV['SENDGRID_API_KEY'])
    @response = response
    @to = to
    @from = from    
    @api_key = api_key
  end

  def send_email(message)
    from = Email.new(email: @from)
    to = Email.new(email: @to)
    subject = 'You were mentioned in a Peep on Chitter!'
    content = Content.new(type: 'text/plain', value: message)
    mail = Mail.new(from, subject, to, content)
    
    sg = SendGrid::API.new(api_key: @api_key)
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    response = @response unless @response.nil?
    response.status_code
  end
end
