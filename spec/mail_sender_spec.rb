require 'mail_sender'

RSpec.describe MailSender do

  include Mail::Matchers

  it 'initializes' do
    mail_sender = MailSender.new
    expect(mail_sender).to be_an_instance_of(MailSender)
  end

  describe '#send_peep_alert' do
    it 'sends the given user a an email saying they have been tagged in a peep' do
      user = double :user, email_address: "User1@gmail.com"
      mail_sender = MailSender.new
      
      expect{ mail_sender.send_peep_alert(user) }.to change {Mail::TestMailer.deliveries.length}.by(1)

      mail = Mail::TestMailer.deliveries.last

      expect(mail).to have_sent_email.to(user.email_address)
      expect(mail.subject).to eq "Chitter alert"
      expect(mail.body).to include "You've been tagged in a peep"
    end
  end
end