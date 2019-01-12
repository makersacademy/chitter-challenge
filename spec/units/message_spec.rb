require './lib/message'

RSpec.describe 'Message' do
  let!(:message) { Message.create(content: 'test1') }
  let(:time) { Time.now }

  describe 'content' do
    it "will return a message" do
      expect(message.content).to eq 'test1'
    end
  end

  describe 'id' do
    it "will return an id" do
      expect(message.id).to eq("#{message.id}".to_i)
    end
  end

  describe '#timestamp' do
    it "will format created_at to display a more user friendly time" do
      allow(message).to receive(:created_at) { time }
      expect(message.timestamp).to eq time.strftime('%d-%m-%y %H:%M:%S')
    end
  end
  
end