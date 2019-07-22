require "./lib/chitter"

describe Chitter do

  describe "#all" do
    it "Returns a chitter object, which we can extract a message instance from" do
      @test = Chitter.new(:message => "Test 1", :posted_by => "Anastasiia", :created_at => Time.now)
      @test.save
      array = Chitter.all
      chitter_object = array[@test.id - 1]
      expect(chitter_object.message).to eq("Test 1")
    end

    it "Returns a chitter object, which we can extract the time from" do
      @test = Chitter.new(:message => "Test 2", :posted_by => "Anastasiia", :created_at => Time.now)
      @test.save
      array = Chitter.all
      chitter_object = array[@test.id - 1]
      expect(chitter_object.created_at).to be_an_instance_of(DateTime)
    end

    it "Returns a chitter object, which we can extract the author from" do
      @test = Chitter.new(:message => "Test 3", :posted_by => "Anastasiia", :created_at => Time.now)
      @test.save
      array = Chitter.all
      chitter_object = array[@test.id - 1]
      expect(chitter_object.posted_by).to eq("Anastasiia")
    end
  end

  describe "#new" do
    it "Creates a new chitter" do
      @test = Chitter.new(:message => "Hey", :posted_by => "Anastasiia", :created_at => Time.now)
      @test.save
      expect(Chitter.all message: "Hey").to include(@test)
    end
  end
end