require 'message'

describe Message do
  describe '.all' do
    it "should return all messages" do
      Message.create(username: 'bro123', content: 'hello world')
      expect(Message.all[0].content).to eq('hello world')
    end
  end
end