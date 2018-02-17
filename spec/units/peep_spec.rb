require 'peep'

describe Peep do

  peeps = described_class.all  

  describe ".all" do

    it "Returns an array of objects that are instances of Peep" do
      expect(peeps[-1]).to be_an_instance_of described_class
    end      

    it 'Returns the peep message attached to a peep object' do
      expect(peeps[-1].peep).to eq("This is my first ever peep!")
    end

    it 'Returns the date attached to a peep object' do 
      expect(peeps[-1].date).to eq "2018-02-17"
    end

    it 'Returns the time attached to the peep object' do
      extracted_time = Time.new.strftime("%H:%M")
      expect(peeps[-1].time).to eq extracted_time
    end
  end

  describe ".create" do
    it "Creates a new peep" do
      Peep.create("Hello this is a new peep")
      expect(peeps[0].peep).to eq("Hello this is a new peep")
    end
  end
end
