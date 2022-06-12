require 'peeps'
require 'pg'

describe Peeps do 
  
  describe '.all' do 
    it 'returns a list of peeps' do 
      conn = PG.connect(dbname: 'chitter_test')

      # Add test data
      peep = Peeps.create(message: "Test Example peep 1")
      Peeps.create(message: "Test Example peep 2")
      Peeps.create(message: "Test Example peep 3")
  
      peeps = Peeps.all

      expect(peeps[0].peep_id).to eq peep.peep_id
      expect(peeps[0]).to be_a Peeps
      expect(peeps[0].message).to eq "Test Example peep 1"
      expect(peeps[1].message).to eq "Test Example peep 2"
      expect(peeps[2].message).to eq "Test Example peep 3"
    end 
  end 

  describe '.create' do 
    it "creates a new peep" do 
      peep = Peeps.create(message: "I love chitter more than twitter!")
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE peep_id = #{peep.peep_id};")

      p persisted_data

      expect(peep).to be_a Peeps
      expect(peep.peep_id).to eq persisted_data.first['peep_id']
      expect(peep.message).to eq "I love chitter more than twitter!"
    end 
  end 
end
