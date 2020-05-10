require './lib/peep'

describe Peep do 
  describe '.all' do
    it 'returns all peep records' do 
      peep_all = Peep.all 

      expect(peep_all).to include('This is a test peep')
      expect(peep_all).to include('This is a second test')
      expect(peep_all).to include('This is a third test')
    end 
  end 
end 