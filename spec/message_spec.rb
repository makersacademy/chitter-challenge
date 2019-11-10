require 'message'

describe Message do
  context '#new_message' do
    it 'adds content, sender and time to database' do
      message = Message.new_message(sender:"Ailsa", content:"FML I love database soo much!!")
      row_creation_verifier = row_creation_verifier(table:"chits", id:message.id)

      expect(message.id).to eq row_creation_verifier['id']
      expect(message.sender).to eq row_creation_verifier['sender']
      expect(message.message).to eq row_creation_verifier['message']

    end
  end


  context "#all" do
    it 'returns all messages in database' do
      message_1 = Message.new_message(sender:"Ailsa", content:"FML I love database soo much!!")
      message_2 = Message.new_message(sender:"Ed", content:"Databases are the bomb")
      message_3 = Message.new_message(sender:"Bea", content:"OMG D A T A B A S E S!")
      array_of_messages = Message.all
      expect(array_of_messages[0].id).to eq message_1.id
      expect(array_of_messages[1].id).to eq message_2.id
      expect(array_of_messages[2].id).to eq message_3.id
    end
  end

  context "#sort" do
    it "chits are sorted - the most resent will appear first" do
      message_1 = Message.new_message(sender:"Ailsa", content:"FML I love database soo much!!")
      message_2 = Message.new_message(sender:"Ed", content:"Databases are the bomb")
      message_3 = Message.new_message(sender:"Bea", content:"OMG D A T A B A S E S!")
      sorted_array = Message.sort(Message.all)
      expect(sorted_array[0].id).to eq message_3.id
      expect(sorted_array[1].id).to eq message_2.id
      expect(sorted_array[2].id).to eq message_1.id
    end
  end
end
