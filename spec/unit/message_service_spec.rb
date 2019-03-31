require './lib/message_service'

describe MessageService do

  describe '.send' do
    it 'send message if a user is tagged in a peep' do
     
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      
      expect(MessageService).to receive(:send)

      MessageService.send
      
    end
  end
end