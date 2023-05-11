require 'mail'

class MailSender
  def send_peep_alert(user)
    Mail.deliver do
      from     'chitterofficial@gmail.com'
      to       user.email_address
      subject  'Chitter alert'
      body     File.read(File.join(__dir__, '../public/peep_alert.txt'))
    end
  end 
end

# this is works in testing but not in practice! It needs a real 'from' email
# and a way to deliver the mail!
# how I think you do this: 
# set up an SMTP server
# somewhere in config, define the mail gem's default delivery method a la
# Mail.defaults do
#   delivery_method :smtp, {
#     address: 'smtp.example.com',
#     port: 587,
#     domain: 'example.com',
#     user_name: 'your_username',
#     password: 'your_password',
#     authentication: 'plain',
#     enable_starttls_auto: true
#   }
# end
# then 