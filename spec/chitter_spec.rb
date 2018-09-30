require "./lib/chitter"

describe Chitter do
  describe "#all" do
    it "Returns a chitter object, which we can extract a name instance from" do
      array = Chitter.all
      chitter_object = array[0]
      expect(chitter_object.message).to eq("Test 1")
    end

    it "Returns a chitter object, which we can extract the time from" do
      array = Chitter.all
      chitter_object = array[0]
      expect(chitter_object.created_at).to be_an_instance_of(DateTime)
    end

    it "Returns a chitter object, which we can extract the author from" do
      array = Chitter.all
      chitter_object = array[0]
      expect(chitter_object.posted_by).to eq("Florence")
    end
  end

  describe "#new" do
    it "Creates a new chitter" do #but not saved because it's a test
      @test = Chitter.new(:message => "Buffy", :posted_by => "Florence", :created_at => Time.now)
      @test.save
      expect(Chitter.all message:"Buffy").to include(@test)
    end
  end
end
