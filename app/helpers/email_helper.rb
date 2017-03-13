require 'sendgrid-ruby'
include SendGrid

def send_reply_notification_email(reply)
  replier = User.get(reply.user_id).name
  original_peep = Peep.get(reply.peep_id)
  peep_content = original_peep.peep_body
  peep_user_email = User.get(original_peep.user_id).email

  from = Email.new(email: 'no-reply@nryn.co.uk')
  subject = "Chitter: Your Peep received a reply from #{replier}!"
  to = Email.new(email: "#{peep_user_email}")
  content = Content.new(type: 'text/plain', value: "Your Peep... \n\n\"#{peep_content}\" \n\n...has just had a reply from #{replier}!\n\nHead to http://immense-citadel-54407.herokuapp.com to check it out.\n\nCheers,\n\nChitter.\nx")
  mail = Mail.new(from, subject, to, content)

  send = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY']).client.mail._('send').post(request_body: mail.to_json)
end
