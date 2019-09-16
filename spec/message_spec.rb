require 'message'

describe Message do
  describe '.create' do
    it 'should create a new message' do
      Message.create(
        username: 'abc',
        msg: 'Test 1',
        created_on: DateTime.new(2019, 1, 1)
      )
      msgs = Message.all
      expect(msgs.length).to eq 1
      
      msg = msgs[0]
      expect(msg.msg_id).not_to be_nil
      expect(msg.username).to eq('abc')
      expect(msg.msg).to eq('Test 1')
      expect(msg.created_on).to eq(DateTime.new(2019, 1, 1))
    end
  end
end
