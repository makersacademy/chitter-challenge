describe Peep do
  before(:each) { @connection = PG.connect dbname: 'chitter_test' }

  describe '.all' do
    it 'returns all peeps stored in the database' do
      Peep.add('Test 1')
      Peep.add('Test 2')
      Peep.add('Most Recent Test')

      peeps = Peep.all
      expect(peeps.length).to eq 3

      peep = Peep.all.first
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep).to respond_to(:time)
      expect(peep.text).to eq 'Most Recent Test'
    end
  end

  describe '.add' do
    it 'adds a peep to the database' do
      peep = Peep.add('Test 1')
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.text).to eq 'Test 1'
    end
  end
end
