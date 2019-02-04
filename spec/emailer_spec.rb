describe Emailer do
  before(:each) do
    Mail::TestMailer.deliveries.clear

  end
   it 'sends emails' do
     Emailer.send_email(to: 'tomdamant@hotmail.com', peeper: 'user2', content: "Hello user2")
     expect(Mail::TestMailer.deliveries.first.to).to eq ['tomdamant@hotmail.com']
     expect(Mail::TestMailer.deliveries.length).to eq 1
   end
end
