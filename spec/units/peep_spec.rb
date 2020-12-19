require 'date'

describe Peep do
  let(:id) { 1 }
  let(:message_1) { 'Test message 1' }
  let(:message_2) { 'Test message 2' }
  let(:message_3) { 'Test message 3' }
  let(:peep) { Peep.new(id: id, message: message_1, time: DateTime.now()) }

  describe '#new' do
    it 'should create a new instance of a Peep' do
      expect(peep).to be_instance_of Peep
      expect(peep.message).to eq message_1
      expect(peep.id).to eq id
      expect(peep.time).to be_instance_of DateTime
    end
  end

  describe '.create' do
    it 'should should insert into peeps table and return an instance of a Peep' do
      result = Peep.create(message: message_1)
      persisted_data = persisted_data_retrieve(id: result.id)

      expect(result).to be_a Peep
      expect(result.id).to eq persisted_data['id']
      expect(result.message).to eq message_1
    end
  end

  describe '.find' do
    it 'should should select a peep from peeps table based on id' do
      persisted_data = persisted_data_insert(message: message_1)
      result = Peep.find(id: persisted_data['id'])

      expect(result).to be_a Peep
      expect(result.id).to eq persisted_data['id']
      expect(result.message).to eq message_1
    end
  end

  describe '.all' do
    it 'should should insert into peeps table and return an instance of a Peep' do
      persisted_data_insert(message: message_1)
      persisted_data_insert(message: message_2)
      persisted_data_3 = persisted_data_insert(message: message_3)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq persisted_data_3['id']
      expect(peeps.first.message).to eq message_3
    end
  end

  describe '.db_connection' do
    it 'should establish an appropriate connection to the chitter database' do
      result = Peep.db_connection

      expect(result).to be_a PG::Connection
    end
  end
end
