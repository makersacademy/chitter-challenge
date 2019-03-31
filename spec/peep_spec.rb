require './models/peep.rb'
require 'database_helpers'
require 'pg'

describe Peep do
  describe '#all_peeps' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_app_test')
      
      # Add the test data
      Peep.create(message: "Peep 1 by Pusheen")
      Peep.create(message: "Peep 2 by Gudetama")
      Peep.create(message: "Peep 3 by Yoda")

      peeps = Peep.all_peeps

      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'Peep 3 by Yoda'
    end
  end

  describe '#create' do
    it 'creates a new peep' do
      
      peep = Peep.create(message: "New Peep by Cinnamon")
      persisted_data = PG.connect(dbname: 'chitter_app_test').query("SELECT * FROM peep_messages WHERE id = #{peep.id};")
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'New Peep by Cinnamon'

    end
  end

end