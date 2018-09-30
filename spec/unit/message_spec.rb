require 'message'

describe Message do
  let(:message) { described_class.new('Mary', 'This is a message') }
  context 'initialize' do
    it 'expects to be initialized with a name and a message' do

      expect(message::username).to eq 'Mary'
      expect(message::body).to eq "This is a message"
    end
  end
end
