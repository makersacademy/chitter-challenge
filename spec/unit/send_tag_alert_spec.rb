require './app/models/send_tag_alert'

describe SendTagAlert do
  let(:user) { double :user, email: "test@test.com" }
  let(:mail_gun_client) { double :mail_gun_client }
  let(:sandbox_domain_name) { ENV["sandbox_domain_name"] }

  it "sends a message to mailgun when it is called" do
    params = { from: "Mailgun Sandbox <postmaster@sandbox525820faaf674cacb7fbe63d187e2983.mailgun.org>",
               to: user.email,
               subject: "You've been tagged in a post!",
               text: "Hello! You've been tagged in a post. Log in to Chitter to see who is talking about you!" }
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user.email, mail_gun_client)
  end
end
