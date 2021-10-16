require 'message'

describe Message do
  describe '.all' do
    it "should return all messages" do
      expect(Message.all[Message.all.length-1].content).to eq('hello world')
    end
  end
end