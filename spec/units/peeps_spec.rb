require 'peeps'

RSpec.describe Peeps do 

  describe ".all" do 

    it 'returns all peeps' do 
       peeps = Peeps.all
      expect(peeps).to include('First Peep')
      expect(peeps).to include('Second Peep')
    end 

  end 

end 