require 'send_recovery_link'

describe SendRecoveryLink do
  let(:user) { double :user, email: "double@double.com", password_token: "123456" }
  let(:mail_gun_client) { double :mail_gun_client }
  let(:sandbox_domain_name) { ENV["MAILGUN_DOMAIN"] }

  it "sends a message to mailgun when it is called" do
    params = {
      from: "chitter@mail.com",
      to: user.email,
      subject: "Reset your password",
      text: "Click here to reset your password https://afternoon-inlet-98969.herokuapp.com/reset_password?token=#{user.password_token}"
    }
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mail_gun_client)
  end
end
