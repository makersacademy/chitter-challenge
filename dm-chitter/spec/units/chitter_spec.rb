require 'chitter'

describe 'Chitter' do

  subject (:chit) {double(:chit, :post => "I like bagels", :time => Time.now.asctime)}

  before (:each) do
    Chitter.connect
  end

  describe "#add" do

    before (:each) do
      Chitter.add(chit)
    end

    it "increments the size of the chitter database by one" do
      expect(Chitter.show_chits.length).to eq 1
    end

    it "adds a chit with a string and the correct time included in the object" do
       expect(Chitter.show_chits[0].post).to eq "I like bagels"
       expect(Chitter.show_chits[0].time).to eq Time.now.asctime
     end
      
  end

  describe "#show_chits" do

    it "returns all the chits as an array sorted in reverse chronological order" do
      cheets = []
      10.times do
        cheets << chit
        Chitter.add(chit)
      end
      cheets.reverse
      for i in 0..Chitter.show_chits.length - 1
        expect(Chitter.show_chits[i].time).to eq cheets[i].time
      end 
    end
    
  end
  
end