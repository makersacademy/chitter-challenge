require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(content: "First peep!")
      Peep.create(content: "Second peep!")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.content).to eq 'Second peep!'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'Test Peep')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'Test Peep'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      peep = Peep.create(content: 'peep peep')

      Peep.delete(id: peep.id)

      expect(Peep.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      peep = Peep.create(content: 'peep peep')
      updated_peep = Peep.update(id: peep.id, content: 'peep')

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq peep.id
      expect(updated_peep.content).to eq 'peep'
    end
  end

  describe '.find' do
    it 'returns the requested peeps' do
      peep = Peep.create(content: 'peep peep')

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq peep.id
      expect(result.content).to eq 'peep peep'
    end
  end
end
