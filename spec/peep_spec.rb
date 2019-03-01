require 'peep'

describe Peep do
  describe '#create_peep' do
    it 'creates an instance of peep' do
      name = 'James'
      handle = 'tso402'
      peep_text = 'I am the best'
      Peep.create_peep(name,handle,peep_text)
      expect(Peep.all.first).to be_an_instance_of(Peep)
    
    end  


end
  
  
  
  describe '#all' do
    it 'returns all current peeps' do
      name = 'James'
      handle = 'tso402'
      peep_text = 'I am the best'
      peep = Peep.create_peep(name,handle,peep_text)
      expect(Peep.all).to eq peep
    end
end

end