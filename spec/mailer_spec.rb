require 'mailer'

describe Mailer do
  subject { described_class }
  describe '.send' do
    it 'send an email with Pony' do
      expect(Pony).to receive(:mail)
      subject.send(email: 'john@example.com', subject: 'testing', message: "My email message")
    end
  end
end
