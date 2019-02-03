require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps in reverse choronological order' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('First peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Second peep');")

      peeps = Peeps.all

      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
    end
  end

  describe '.create' do
  it 'creates a new peep' do
    Peeps.create(peep: 'This is just a random peep.')

    expect(Peeps.all).to include 'This is just a random peep.'
  end
end
end
