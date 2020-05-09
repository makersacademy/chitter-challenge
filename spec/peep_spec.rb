require 'peep'

describe Peep do

  describe '.all' do
    it 'retrieves all the peeps from the database' do
      PG.connect(dbname: 'chitter-test')
        .exec("INSERT INTO peeps (peep) VALUES('This is a test peep!');")

      expect(Peep.all).to include 'This is a test peep!'
    end
  end

  describe '.create' do
    it 'creates and stores a peep in the database' do
      Peep.create(peep: 'This is a peep')

      expect(Peep.all).to include 'This is a peep'
    end
  end
end
