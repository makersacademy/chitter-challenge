

describe Message do 

  describe 'add' do
    it 'adds a message to all messages' do
      message = Message.create(content: 'hello!')
      expect(message).to be_a Message
      expect(message.content).to eq 'hello!'
    end
  end

  it 'shows the time posted next ot the message' do 
    Timecop.freeze(2019, 3, 31, 0, 0, 0)
    message = Message.create(content: 'hello!')
    expect(message.created_at).to eq '2019-03-31 00:00:00 UTC'

  end

end
