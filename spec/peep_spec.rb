require 'peep'

describe Peep do

  describe '#all' do
    it 'should return a list of peeps' do
      peeps = Peep.all
      expect(peeps).to include ({:peep => "test1", :time => nil, :username => "username1"})
      expect(peeps).to include ({:peep => "test2", :time => nil, :username => "username1"})
    end
  end

  describe '#store' do
    it 'allows a user to create a new peep' do
      Peep.store("new peep", "username1")
      expect(Peep.all).to include ({:peep => "new peep", :time => (Time.now.strftime "%d-%^b-%Y %H:%M"), :username => "username1"})
    end
  end

end
