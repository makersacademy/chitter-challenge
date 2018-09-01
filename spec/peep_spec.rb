require 'peep'

describe '.all' do
  describe 'can see all peeps' do
    it 'returns all peeps sent' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('Hello');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hey');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hi');")

      peeps = Peep.all
      peep = peeps.first

      expect(peep.peep).to eq "Hi"
      expect(peeps.length).to eq 3

    end
  end
end

describe '.create' do
  describe 'can add a peep' do
    it 'returns a peep posted' do

      Peep.create("Hello peeps!")
      peep = Peep.all.first

      expect(peep.peep).to eq "Hello peeps!"
    end
  end
end
