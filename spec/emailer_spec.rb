describe Emailer do
  before(:each) do
    Mail::TestMailer.deliveries.clear
    Emailer.send_email(to: 'tomdamant@hotmail.com', peeper: 'user2', content: "Hello user2")
  end
   it 'does something' do
     print "#{Mail::TestMailer.deliveries.length}"
     expect(Mail::TestMailer.deliveries.length).to eq 1
   end
end
