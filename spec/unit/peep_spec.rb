require 'peep'

describe Peep do
  @fake_timestamp = "11pm"

  describe '.all' do 
    it 'returns all the peeps' do
      Peep.create(peep_body: 'Example peep 1', created_at: @fake_timestamp)
      Peep.create(peep_body: 'Example peep 2', created_at: @fake_timestamp)

      peeps = Peep.all
      
      expect(peeps).to include("Example peep 1")
      expect(peeps).to include("Example peep 2")
    end 
  end 

  describe '.create' do 
    new_peep = Peep.create(peep_body: 'my new peep', created_at: @fake_timestamp)

    it 'creates a new peep' do
      expect(new_peep.peep_body).to include 'my new peep'
    end

    it 'displays the time' do 
      expect(new_peep.created_at).to include @fake_timestamp
    end 
  end 

end
