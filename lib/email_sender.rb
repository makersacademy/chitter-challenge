require 'dotenv'
require 'sib-api-v3-sdk'
Dotenv.load

class EmailSender
  def initialize(recipient, html_message, email_api=SibApiV3Sdk)
    @email_api = email_api
    @recipient = recipient
    @html_message = html_message

    @email_api.configure do |config|
      config.api_key['api-key'] = ENV['BREVO_API_KEY']
      config.api_key['partner-key'] = ENV['BREVO_API_KEY']
    end
  end

  def send_email(
    transactional_email_api=@email_api::TransactionalEmailsApi,
    api_email_data=@email_api::SendSmtpEmail,
    api_email_to=@email_api::SendSmtpEmailTo,
    api_email_sender=@email_api::SendSmtpEmailSender
  )

    api_instance = transactional_email_api.new

    send_smtp_email = api_email_data.new
    send_smtp_email.html_content = @html_message
    send_smtp_email.subject = "You've been tagged!"
    
    email_to = api_email_to.new
    email_to.email = @recipient
    send_smtp_email.to = [email_to]
    
    email_from = api_email_sender.new
    email_from.email = ENV['EMAIL_FROM']
    send_smtp_email.sender = email_from
    
    begin
      result = api_instance.send_transac_email(send_smtp_email)
      p result
    rescue @email_api::ApiError => e
      binding.irb
      puts "Exception when calling TransactionalEmailsApi->send_transac_email: #{e}"
    end
  end
end

message = '<html>Slay queen</html>'
sender = EmailSender.new('evanthomas0292@gmail.com', message)
sender.send_email