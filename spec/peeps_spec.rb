require 'peeps'
require 'database_helpers'

describe Peep do 
  # before :all do
  #   t = Time.local(2019, 02, 15, 12, 0, 0)
  #   Timecop.travel(t)
  # end
  
  describe "#all" do 
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(text: "This is the first test peep")
      Peep.create(text: "This is the second test peep")
      Peep.create(text: "This is the third test peep")
  
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq "This is the first test peep"
      # expect(peeps.first.time_created).to eq "2020-02-15 12:00:00.000000"
      expect(peeps.first.time_created).to be_a String
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: "This is the first test peep")
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq "This is the first test peep"
      # expect(peep.time_created).to eq "2020-02-15 12:00:00.000000"
      expect(peep.time_created).to be_a String
    end
  end
end 
