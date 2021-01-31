require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      Peep.create(peep: "I love this new app Chitter", username: "timmy_toes")
      Peep.create(peep: "Red bull gives you wings", username: "timmy_toes")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first.peep).to eq 'I love this new app Chitter'
      expect(peeps.first.username).to eq 'timmy_toes'
      # expect(peeps).to include("I love this new app Chitter")
    end
  end

  describe '.create' do
    it 'creates a new peep' do

      peep = Peep.create(peep: 'Red bull gives you wings', username: 'timmy_toes')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'Red bull gives you wings'
      expect(peep.username).to eq 'timmy_toes'
    end
  end
end
