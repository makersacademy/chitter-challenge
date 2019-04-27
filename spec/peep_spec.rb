require 'peep'

describe Peep do
  describe '#all' do
    it 'returns an array' do
      expect(described_class.all).to be_an_instance_of(Array)
    end

    it 'returns an array which contains peeps' do
      populate_table
      expect(described_class.all.join).to include('test 1')
      expect(described_class.all.join).to include('test 2')
      expect(described_class.all.join).to include('test 3')
    end
  end

  describe '#create' do
    it 'adds peep to database' do
      Peep.create(message: 'test message')
      expect(Peep.all.join).to include('test message')
    end
  end
end
