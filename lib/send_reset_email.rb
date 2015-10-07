require 'mailgun'

class SendResetEmail

  def initialize(user)
    @user = user
    @client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
  end

  # def call
  #   @client.send_message(to: @user.email, message: "You have requested a password reset. Follow this link to continue:
  #     http://www.chitter.com/password_reset/#{@user.password_token}")
  # end

  def send_message
    RestClient::Request.execute(
      :url => "https://api:#{ENV['MAILGUN_API_KEY']}@api.mailgun.net/v3/sandbox119f7055446a45519d466456e9412df8.mailgun.org/messages",
      :method => :post,
      :payload => {
        :from => "noreply@email.com",
        :to => @user.email,
        :subject => "Hello",
        :text => "Reset your password!",
      },
      :verify_ssl => false)
  end
end
