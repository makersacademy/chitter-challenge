require 'mailgun'

class SendResetEmail

  def initialize(user)
    @user = user
    @client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
  end

  def send_message
    RestClient::Request.execute(
      :url => "https://api:#{ENV['MAILGUN_API_KEY']}@api.mailgun.net/v3/sandbox119f7055446a45519d466456e9412df8.mailgun.org/messages",
      :method => :post,
      :payload => {
        :from => "noreply@email.com",
        :to => @user.email,
        :subject => "Hello",
        :text => "Reset your password by clicking the link below"\
                 "http://rocky-taiga-9772.herokuapp.com/users/password_reset/#{@user.password_token}",
      },
      :verify_ssl => false)
  end
end
