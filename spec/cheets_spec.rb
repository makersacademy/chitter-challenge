require './lib/cheets'

describe Cheets do

  describe '.all' do
    it "stores a list of test cheets" do
      cheets = Cheets.all

      expect(cheets).to include('Test Cheet One')
      expect(cheets).to include('Test Cheet Two')
      expect(cheets).to include('Test Cheet Three')
    end
  end
end
