require './app/models/email'

RSpec.describe Email do
  include Mail::Matchers

  context "should send an email" do
    Mail::TestMailer.deliveries.clear
    subject { Email.send_email(to: 'alice.smith@gmail.com') }
    it { is_expected.to have_sent_email.from('peeps@chitter.com') }
    it { is_expected.to have_sent_email.to('alice.smith@gmail.com') }
    it { is_expected.to have_sent_email.with_subject('You have a new peep!') }
    it { is_expected.to have_sent_email.with_body('Please connect to Chitter to see your new peep!') }
  end
end
