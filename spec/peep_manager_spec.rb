require './app/lib/peep_manager'

describe PeepManager do
  let(:peep_class) {double :peep_class_double, new: peep }
  let(:peep) {double :peep_double, id: 1, user_id: 1, peep_content: 'I am cool', timestamp: '2018-05-13 11:23:25+01' }

  describe '#display_posts' do
    it 'responds to #display_posts' do
      expect(described_class).to respond_to(:display_posts)
    end
    it 'returns an array of objects' do
      expect(described_class.display_posts).to be_an_instance_of(Array)
    end
    it 'returns an array of peep objects' do
      expect(described_class.display_posts).to be_an_instance_of(Array)
    end
  end

  describe 'dependency injection on initialization' do
    it 'should take peep class as an initialisation variable' do
      described_class.new(peep_class)
      expect(described_class.instance_variable_get(:@peep_class)).to eq peep_class
    end
  end
end