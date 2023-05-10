require 'email_sender'

RSpec.describe EmailSender do
  describe '#send_email' do
    xit 'sends an email' do
      fake_api = double :fake_api




      allow(fake_api).to receive(:configure)

      allow(fake_api::TransactionalEmailsApi).to receive(:new)
      allow(fake_api::SendSmtpEmail).to receive(:new)
      allow(fake_api::SendSmtpEmailTo).to receive(:new)
      allow(fake_api::SendSmtpEmailSender).to receive(:new)



      sender = EmailSender.new(
        'test_email@email.com',
        '<h1>test_content</h1>',
        fake_api
      )
      sender.send_email

    end
  end
end