require 'chitter'

describe Chitter do
  let(:message) { "First Tweet" }
  it 'receives a message' do
    expect(subject.add_message(message)).to include(message)
  end
end
