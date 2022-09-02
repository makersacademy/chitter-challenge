require 'sendgrid-ruby'
require 'dotenv/load'
include SendGrid

class SendEmail 
  def initialize(tagged_user, post, post_author)
    @from = Email.new(email: 'nickwlong@hotmail.com')
    @to = Email.new(email: 'nickwlong@gmail.com')
    @subject = "Chitter! You have been tagged in a post by #{post_author}"
    @content = Content.new(type: 'text/plain', value: "Dear #{tagged_user.name},\n You have been tagged in a post on Chitter! It says:\n\n    '#{post.content}'\n\nCome and visit our fantastic service to see more peeps, and create a peep of your own.\n\nBest wishes,\nAll of us at Chitter")
  end

  def send_mail
    mail = Mail.new(@from, @subject, @to, @content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end