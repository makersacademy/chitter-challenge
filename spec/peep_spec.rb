require 'peep'

describe Peep do

  before(:each) do
    @connection = DatabaseConnection.setup(DB_TEST)
  end

  describe '.all' do

    it "should return an array of instances of the link class" do
      expect(Peep.all).to be_a Array
      expect(Peep.all[0]).to be_a Peep
      expect(Peep.all[1]).to be_a Peep
      expect(Peep.all[2]).to be_a Peep
    end

  end

  describe '.add' do

    it "should add a peep" do
      Peep.add('Peep.rb test peep', 'George', '09:21:30 PM' )

      expect(Peep.all[3].peep).to eq('Peep.rb test peep')
    end


  end

end
