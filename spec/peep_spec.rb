require './lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps in an array' do
      connection = PG.connect(dbname: 'peep_manager_test')
      subject.add('The night I lost CTRL')
      expect(subject.all).to include('The night I lost CTRL')
    end
  end

  describe '.add' do
    it 'should add a peep to the stored peeps' do
      subject.add('The night I lost CTRL')
      expect(subject.all).to include('The night I lost CTRL')
    end
end
end
