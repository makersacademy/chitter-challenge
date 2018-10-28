# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep

# require 'sender'
# require 'peep'
# require 'user'
describe "sending an email" do
  include Mail::Matchers

  before(:each) do
    Mail::TestMailer.deliveries.clear

    Mail.deliver do
      to 'testemail'
      from 'you@you.com'
      subject 'testing'
      body 'hello'
    end
  end
  it { is_expected.to have_sent_email } # passes if any email at all was sent

  it { is_expected.to have_sent_email.from('you@you.com') }
  it { is_expected.to have_sent_email.to('testemail') }

end
