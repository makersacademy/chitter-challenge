require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (text) VALUES ('the sky is blue');")
      connection.exec("INSERT INTO peeps (text) VALUES ('the sea is green');")
      connection.exec("INSERT INTO peeps (text) VALUES ('fire is red');")

      peeps = Peep.all

      peep = peeps.first

      expect(peeps.length).to eq 3
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.text).to eq('fire is red')
    end
  end

  describe '.create' do
    it 'adds a peep to the peep feed' do

      peep = Peep.create(text: 'space is black')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq('space is black')

    end
  end

  describe '.delete' do
    it 'deletes a peep from the chitter feed' do
      peep = Peep.create(text: "pizza is red and yellow")
      Peep.delete(id: peep.id)
      expect(Peep.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates a peep in the chitter feed' do
      peep = Peep.create(text: "Mug is white")
      updated_peep = Peep.update(id: peep.id, text: "Mug is NOT white")

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq(peep.id)
      expect(updated_peep.text).to eq("Mug is NOT white")
    end
  end

  describe '.find' do
    it 'returns the requested peep' do
      peep = Peep.create(text: "bees make honey")

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq(peep.id)
      expect(result.text).to eq("bees make honey")
    end
  end
end
