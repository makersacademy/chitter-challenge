require 'messages'

describe Messages do 
  context '.get_all' do 
    connection = PG.connect(dbname: 'chitter_test')
    it 'returns all messages' do 
      # test data set up 
      
      new_message = Messages.create(message: 'hi', name: 'Gina')
      Messages.create(message: "2nd new message", name: "Mr get all")
      Messages.create(message: "3rd new message", name: "Doctor get all")
      
      messages = Messages.get_all

      #expect(messages.length). to eq 3
      expect(messages.first).to be_a Messages # Messages class 
      expect(messages.first.id).to eq new_message.id
      expect(messages.first.message).to eq 'hi'
      expect(messages.first.name).to eq 'Gina'
      
    end 
  end 
  context '.create' do 
    it 'creates a new message' do 
      new_message = Messages.create(message: "testing create method", name: "Mr Create")
      
      #expect(new_message[0]['name']).to include "Mr Create"
      expect(new_message.name).to eq "Mr Create"
      expect(new_message.message).to eq "testing create method"
    end 
  end 

end 