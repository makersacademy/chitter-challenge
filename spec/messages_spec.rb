require 'messages'
require 'users'

describe Messages do
  describe '#create' do
    it 'create a new message' do
      user = Users.create('test@test.com', 'password', 'John Doe', 'J')
      message = Messages.create('Hello', user.id)
      expect(message).to be_a Messages
      expect(message.text).to eq 'Hello'
    end
  end

  # describe '#see_all' do
  #   it 'shows all the messages' do
  #     Messages.new('Hello')
  #     Messages.new('Hello Chitter')
  #     Messages.new('Hello World')
  #     expect(Messages.see_all).to include('Hello')
  #     expect(Messages.see_all).to include('Hello Chitter')
  #     expect(Messages.see_all).to include('Hello World')
  #   end
  # end
end
