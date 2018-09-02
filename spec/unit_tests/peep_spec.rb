require 'peep'

describe Peep do
  let(:comment) { 'Hi all. Just coding away' }
  subject { described_class.create(comment) }
  it 'saves the comment to the database' do
    expect(subject.text).to eq comment
  end

  describe '.all' do
    it 'returns all the peeps' do
      result = described_class.all
      expect(result[0]).to be_a Peep
      expect(result[1]).to be_a Peep
    end
  end
end
