require 'peep'

describe Peep do
  let(:user_klass) { double :user_klass, active: user}
  let(:user) { double :user, id: 1 }
  let(:comment) { 'Hi all. Just coding away' }
  subject { described_class.create(comment, user_klass) }
  it 'saves the comment to the database' do
    expect(subject.text).to eq comment
  end
  it 'knows the time the peep was made' do
    expect(subject.time).to be_a Time
  end

  describe '.all' do
    it 'returns all the peeps' do
      result = described_class.all
      expect(result[0]).to be_a Peep
      expect(result[1]).to be_a Peep
    end
  end

  describe '#nice_date' do
    it 'returns the date of the peep in a nice format' do
      expect(subject.nice_date).to eq "03-09-2018"
    end
  end
  describe '#nice_time' do
    it 'returns the time of the peep in a nice format' do
      expect(subject.nice_time.length).to eq 5
    end
  end
end
