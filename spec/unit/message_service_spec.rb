# TO DO: pending mocking for USER and actual implementation of this test for sending a message

require './lib/message_service'

describe Email do
  let(:email) { double(:email) }

  describe '.send' do
    pending
    it 'send message if a user is tagged in a peep' do
     
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      
      allow(email).to receive(:send)

      email.send
      
    end
  end
end