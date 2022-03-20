require 'message'

describe Message do
  subject(:message_class) { described_class.new(id, message, timestamp) }
  let(:id) { 13 }
  let(:message) { 'Today I had air for lunch. The flavour was exquisite.' }
  let(:timestamp) { '2022-03-20 18:30:48' }

  it 'initializes an id' do
    expect(message_class.id).to eq id
  end

  it 'initializes a message' do
    expect(message_class.message).to eq message
  end

  it 'initializes a timestamp' do
    expect(message_class.timestamp).to eq timestamp
  end
end