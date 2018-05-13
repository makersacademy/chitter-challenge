require './app/lib/manager'

describe Manager do
  let(:peep_class) {double :peep_class_double, new: peep }
  let(:peep) {double :peep_double, id: 1, user_id: 1, peep_content: 'I am cool', timestamp: '2018-05-13 11:23:25+01' }
  let(:user_class) {double :user_class_double, new: user}
  let(:user) { double :user_double}

  describe '#get_all_posts' do
    it 'returns an array of objects' do
      expect(described_class.get_all_posts).to be_an_instance_of(Array)
    end
    it 'returns an array of peep objects' do
      described_class.instance_variable_set(:@peep_class, peep_class)
      expect(described_class.get_all_posts[0]).to eq peep
    end
  end
  describe '#get_all_users' do
    it 'returns an array of objects' do
      expect(described_class.get_all_users).to be_an_instance_of(Array)
    end
    it 'returns an array of peep objects' do
      described_class.instance_variable_set(:@user_class, user_class)
      expect(described_class.get_all_users[0]).to eq user
    end
  end
end