require 'peeps'

describe Peeps do 
  describe "#all" do 
    it 'show a list of all peeps' do 
      expect(Peeps.all).to be_an Array
    end 
  end 
end 