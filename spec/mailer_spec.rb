require_relative '../app/lib/mailer'

describe Mailer do
 let(:user) {double :user, email: "test@test.com", password_token: "12345678"}
 let(:mail_gun_client){double :mail_gun_client}
 let(:sandbox_domain_name) { ENV["sandbox_domain_name"] }

 it "sends a message to mailgun when called" do
   params = { from: "Chitter Mail <postmaster@>",
              to: user.email,
              subject: "You have been tagged in a Peep",
              text: "You have been tagged in a Peep" }
   expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
   described_class.call(user, mail_gun_client)
 end
end
