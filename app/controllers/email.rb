require 'rest-client'

class MailgunWrapper

  def send_email_to user
    api_key = ENV['MAILGUN_API_KEY']
    api_url = "https://api:#{api_key}@api.mailgun.net/v2/app2064a568116c4930b75d7cf85f646da6.mailgun.org"

      RestClient::Request.execute(
        url: api_url + '/messages',
        method: :post,
        payload: {
          from: 'postmaster@app2064a568116c4930b75d7cf85f646da6.mailgun.org',
          to: 'timrobertson0122@gmail.com',
          subject: 'This is subject',
          text: 'This is text',
          html: 'https://quiet-wave-4756.herokuapp.com/password/reset' + user.password_token,
          multipart: true
        },
        headers: {
          "h:X-My-Header": 'www/mailgun-email-send'
        },
        verify_ssl: false
      )
    end
end