require 'peep_comment'

describe Comment do
  let(:user_klass) { double :user_klass, active: user }
  let(:user) { double :user, id: 1 }
  let(:peep_klass) { double :peep_klass }
  let(:peep) { double :peep, id: 1 }
  let(:pcomment) { 'I agree' }
  subject { described_class.create(pcomment, peep.id, user_klass) }
  it 'saves the comment body to the database' do
    expect(subject.text).to eq pcomment
  end
  it 'knows the time the comment was made' do
    expect(subject.time).to be_a Time
  end

  describe '.all' do
    it 'returns all the peeps' do
      subject
      result = described_class.all
      expect(result[0]).to be_a Comment
    end
  end
end
