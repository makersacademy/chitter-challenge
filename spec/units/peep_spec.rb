describe Peep do
  let(:id) { 1 }
  let(:message) { 'Test message' }
  let(:peep) { Peep.new(id: id, message: message) }

  describe '#new' do
    it 'should create a new instance of a Peep' do
      expect(peep).to be_instance_of Peep
      expect(peep.message).to eq message
      expect(peep.id).to eq id
    end
  end

  describe '.create' do
    it 'should should insert into peeps table and return an instance of a Peep' do
      result = Peep.create(message: message)
      persisted_data = persisted_data_retrieve(id: result.id)

      expect(result).to be_a Peep
      expect(result.id).to eq persisted_data['id']
      expect(result.message).to eq message
    end
  end

  describe '.find' do
    it 'should should select a peep from peeps table based on id' do
      persisted_data = persisted_data_insert(message: message)
      result = Peep.find(id: persisted_data['id'])

      expect(result).to be_a Peep
      expect(result.id).to eq persisted_data['id']
      expect(result.message).to eq message
    end
  end

  describe '.db_connection' do
    it 'should establish an appropriate connection to the chitter database' do
      result = Peep.db_connection

      expect(result).to be_a PG::Connection
    end
  end
end
