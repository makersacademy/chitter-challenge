describe Message do 


  describe 'add' do
    it 'adds a message to all messages' do
      message = Message.create(content: 'hello!')
      expect(message).to be_a Message
      expect(message.content).to eq 'hello!'
    end
  end







  
end 