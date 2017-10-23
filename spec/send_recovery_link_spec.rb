require 'send_recover_link'

describe SendRecoverLink do
 let(:maker){double :maker, email: "test@test.com", password_token: "12345678"}
 let(:mail_gun_client){double :mail_gun_client}
 let(:sandbox_domain_name) { ENV["sandbox_domain_name"] }

 it "sends a message to mailgun when it is called" do
   params = {from: "chitter@mail.com",
             to: maker.email,
             subject: "reset your password",
             text: "click here to reset your password http://yourherokuapp.com/reset_password?token=#{maker.password_token}" }
   expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
   described_class.call(maker, mail_gun_client)
 end
end
