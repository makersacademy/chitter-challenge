require 'spec_helper'

describe Message do
  context 'Demonstration of how Chitter works' do

    it 'message is created and then retrieved from the db' do
      expect(described_class.count).to eq(0)
      described_class.create(memo: 'chat message here')
      expect(described_class.count).to eq(1)
      message = described_class.first
      expect(message.memo).to eq('chat message here')
      message.destroy
      expect(described_class.count).to eq(0)
    end
  end
end
