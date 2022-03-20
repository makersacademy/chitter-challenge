require 'chitter'

describe Chitter do
  subject(:chitter) { described_class }
  subject(:chitter_all) { described_class.all }
  let(:id) { 13 }
  let(:message) { 'Today I had air for lunch. The flavour was exquisite.' }
  let(:timestamp) { '2022-03-20 18:30:48' }

  describe '.all' do
    it 'returns instances of the chitter table' do
      expect(chitter_all).to be_an_instance_of(Array)
    end
  end

  describe '.submit' do
    it 'submits a message' do
      chitter.submit(message)
      expect(chitter_all.first.message).to eq message
    end
  end
end
