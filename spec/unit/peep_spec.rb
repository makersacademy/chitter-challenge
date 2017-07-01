describe Peep do
  subject(:peep) { described_class.new(message: "test", created_at: Time.now) }

  it { is_expected.to be_a Peep }
  it { is_expected.to belong_to :user }
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :message }
  it { is_expected.to have_property :created_at }

  describe '#time' do
    it { is_expected.to respond_to :time }

    it 'returns the time the peep was made' do
      expect(subject.time).to match /(\d{1,2}):(\d{1,2}) (\d{1,2})-(\d{1,2})-(\d{4})/
    end
  end
end
