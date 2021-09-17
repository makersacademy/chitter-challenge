require 'message'
describe Message do

  context 'I want to post a message (peep) to chitter' do

    let(:message) { Message.new(id: 1, message: "hello hello", create_date: "2021-07-12 20:46:56.952782" ) }

    it 'Checks a message object exists with an id' do
      expect(message.id).to eq 1
      expect(message.message).to eq "hello hello"
      expect(message.create_date).to eq "2021-07-12 20:46:56.952782"
    end

  end

end