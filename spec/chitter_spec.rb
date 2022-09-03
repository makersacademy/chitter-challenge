require 'chitter'

RSpec.describe 'Chitter' do
  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep_1 = Chitter.create(text: "peep_1")
      peep_2 = Chitter.create(text: "peep_2")
      peep_3 = Chitter.create(text: "peep_3")
      
      peeps = Chitter.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Chitter
      expect(peeps.first.text).to eq "peep_3"
      expect(peeps.first.id).to eq peep_3.id
      expect(peeps.first.timestamp).to start_with "2022"
    end
  end

  describe '.create' do
    it 'creates a new peep with timestamp' do
      peep = Chitter.create(text: "peep peep one two")

      expect(peep.text).to eq "peep peep one two"
      expect(peep.timestamp).to start_with "2022"
    end 
  end
end


