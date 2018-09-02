require 'peep'

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
      expect(peep.text).to eq('the sky is blue')
    end
  end


  describe '.create' do
    it 'adds a peep to the peep feed' do

      peep = Peep.create('space is black')

      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.text).to eq('space is black')

    end
  end


  describe '.delete' do
    it 'deletes a peep from the chitter feed' do
      peep = Peep.create("pizza is red and yellow")
      Peep.delete(peep.id)
      expect(Peep.all.length).to eq(0)
    end
  end


  describe '.update' do
    it 'updates a peep in the chitter feed' do
      peep = Peep.create("Mug is white")
      updated_peep = Peep.update(peep.id, "Mug is NOT white")

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq(peep.id)
      expect(updated_peep.text).to eq("Mug is NOT white")

    end
  end




end
