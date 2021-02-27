require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a new Peep and adds it to the database' do
      peep = Peep.create(peep: "test")
      persisted_data = DatabaseConnection.query("SELECT * FROM peeps WHERE peep = '#{peep.peep}'")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'test'
    end
  end

  describe '.all' do
    it 'returns a list of peeps' do
      peep = Peep.create(peep: 'hi there!')
      Peep.create(peep: 'Wooaahhh')
      Peep.create(peep: 'Tests should always be green!')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq 'hi there!'
    end
  end
end
