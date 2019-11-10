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
end
