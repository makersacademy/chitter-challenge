require 'peeps'

RSpec.describe Peeps do 

  describe ".all" do 
    it 'returns all peeps' do 
      peeps = Peeps.all
      expect(peeps).to include('first peep')
      expect(peeps).to include('second peep')
    end 
  end
  
  describe ".post" do 
      it 'adds a new peep' do 
        Peeps.post("New peep")
        expect(Peeps.all).to include("New peep")
      end 
    end

end 