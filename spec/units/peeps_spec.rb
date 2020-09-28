require 'peeps'
require 'pg'

RSpec.describe Peeps do 

  describe ".all" do 
    it 'returns all peeps' do
      Peeps.post('first peep')
      Peeps.post('second peep')
      peeps = Peeps.all
      expect(peeps).to be_instance_of Array
    end 
  end
  
  describe ".post" do 
    it 'adds a new peep' do 
      Peeps.post("New peep")
      expect(Peeps.all).not_to be_empty
    end 
  end

end
