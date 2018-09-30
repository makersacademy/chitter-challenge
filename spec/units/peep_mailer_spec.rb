require 'peep_mailer'

RSpec.describe PeepMailer do
  let(:fake_pony) { double :Pony }

  subject { described_class.new(mail_client: fake_pony) }

  it 'can send emails' do
    
  end
end
