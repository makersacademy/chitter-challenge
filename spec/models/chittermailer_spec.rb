require './app/models/chitter_mailer'

describe ChitterMailer do
  let(:user){double :user, email_address: "test@123.com", password_token: "12345678", username: "Test123"}
  let(:mail_gun_client){double :mail_gun_client}
  let(:sandbox_domain_name) { ENV["sandbox_domain_name"] }

  it 'sends message to mailgun when it is called' do
    params = {from: "bookmarkmanager@mail.com",
           to: user.email_address,
           subject: "You have successfully registered",
           text: "Thank you for registering with Chitter, your username is #{user.username}" }
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mail_gun_client)
  end
end
