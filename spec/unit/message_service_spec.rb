require './lib/message_service'

describe Email do

  describe '.send' do
    it 'send message if a user is tagged in a peep' do
     
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      
      expect(Email).to receive(:send)

      Email.send
      
    end
  end
end