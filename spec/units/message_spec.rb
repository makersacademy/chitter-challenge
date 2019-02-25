require './lib/message'

RSpec.describe 'Message' do
  let!(:message) { Message.create(content: 'test1') }
  let(:time) { Time.now }

  describe 'content' do
    it "It returns a message" do
      expect(message.content).to eq 'test1'
    end
  end

  describe '.timestamp' do
    it "It formats created_at to display a more user friendly time" do
      allow(message).to receive(:created_at) { time }
      expect(message.timestamp).to eq time.strftime('%d-%m-%y %H:%M:%S')
    end
  end
  
end