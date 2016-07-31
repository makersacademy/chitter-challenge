require './app/lib/send_email'
require 'dotenv'
Dotenv.load

describe SendEmail do
 let(:user){double :user, email: "test@test.com", password_token: "12345678"}
 let(:mail_gun_client){double :mail_gun_client}
 let(:sandbox_domain_name) { ENV["domainNAME"] }

 it "sends a message to mailgun when it is called" do
   params = {from: "Chitter <mailgun@chitter.com>",
             to: user.email,
             subject: "reset your password",
             text: "click here to reset your password http://localhost:4567/users/reset_password?token=#{user.password_token}"}
   expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
   described_class.call(user, mail_gun_client)
 end
end
