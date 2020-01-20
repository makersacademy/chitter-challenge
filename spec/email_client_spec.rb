require 'email_client'

describe EmailClient do

  describe '.setup' do
    it 'adds mail defaults to mail gem' do
      expect(Mail).to receive(:defaults)

      EmailClient.setup
    end
  end

  describe '.send_email' do
    it 'rescues errors from mail gem' do
      expect{EmailClient.send_email('test@mail.com', 'Username', 'testmessage')}.to output("Connection refused - connect(2) for \"localhost\" port 25\n").to_stdout
    end

    let(:email){double :email, :deliver => nil}

    it 'sends email using mail gem' do

      allow(Mail).to receive(:new).and_return(email)
      expect(email).to receive(:deliver)

      EmailClient.send_email('test@mail.com', 'Username', 'testmessage')
    end
  end


end
