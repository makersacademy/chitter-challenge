require 'message'

describe Message do
  describe '.all' do
    it "should return all messages" do
      expect(Message.all[0].content).to eq('hello world')
    end
  end
end