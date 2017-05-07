require './app/models/recovery_link'

describe RecoveryLink do
 let(:user){double :user, email: "izzy@example.com", password_token: "password"}
 let(:mail_gun_client){double :mail_gun_client}
 let(:sandbox_domain_name) { ENV["sandbox_domain_name"] }

 it "sends a message to mailgun when it is called" do
   params = {from: "bookmarkmanager@mail.com",
             to: user.email,
             subject: "reset your password",
             text: "click here to reset your password http://ilarne-chitter.heroku.com/reset_password?token=#{user.password_token}" }
   expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
   described_class.call(user, mail_gun_client)
 end
end
