require 'chitter'

RSpec.describe 'Chitter' do
  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep_1 = Chitter.create(text: "peep_1")
      peep_2 = Chitter.create(text: "peep_2")
      peep_3 = Chitter.create(text: "peep_3")

      # connection.exec("INSERT INTO peeps (text) VALUES('peep_1');")
      # connection.exec("INSERT INTO peeps (text) VALUES('peep_2');")
      # connection.exec("INSERT INTO peeps (text) VALUES('peep_3');")
      
      peeps = Chitter.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Chitter
      expect(peeps.first.text).to eq "peep_3"
      expect(peeps.first.id).to eq peep_3.id
      expect(peeps.first.timestamp).to start_with "2022"
      # expect(peeps).to include "peep_1"
      # expect(peeps).to include "peep_2"
      # expect(peeps).to include "peep_3"
      # #returns in reverse chronological order
      # expect(peeps).to eq ["peep_3", "peep_2", "peep_1"]
    end
  end

  describe '.create' do
    it 'creates a new peep with timestamp' do
      Chitter.create(text: "peep peep one two")

      expect(Chitter.all).to include "peep peep one two"
      expect(peep.timestamp).to be_kind_of(Time)
    end 
  end
end


