require './app/models/chitter_mailer'

describe ChitterMailer do
  let(:user){double :user, email_address: "test@123.com", password_token: "12345678", username: "Test123"}
  let(:mail_gun_client){double :mail_gun_client}
  let(:mailgun_domain_name) { ENV['sandbox_domain_name'] }

  it 'sends message to mailgun when it is called' do
    params = {from: "chittermailer@mail.com",
           to: user.email_address,
           subject: "You have successfully registered to Chit",
           text: "Thank you for registering with Chitter, your username is #{user.username}" }
    expect(mail_gun_client).to receive(:send_message).with(mailgun_domain_name, params)
    described_class.call(user, mail_gun_client, mailgun_domain_name)
  end
end
