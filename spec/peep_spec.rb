require 'peep' 


describe Peep do 
  # describe '.all' do 
  #   it 'returns a list of peep messages' do
  #     connection = PG.connect(dbname: 'chitter_test')
  #     peep = Peep.create(message: 'My first peep message')
  #     expect(peep.message).to eq 'My first peep message'
  #   end 
  # end 

  describe '.create' do 
    it 'creates a new peep message' do 
      peep = Peep.create(message: 'My first peep message')
      expect(peep).to be(Peep)
      expect(peep.message).to eq 'My first peep message' 
    end 
  end 
end
