require './lib/chitter'

describe Chitter do

  context ".all" do
    it "displays all the peeps" do
      Chitter.create(post: "Dear Diary")
      Chitter.create(post: "Unicorns are real")
      peeps = Chitter.all

      expect(peeps.length).to eq 2
      expect(peeps[0]).to eq "Dear Diary"
    end
  end
    
  context ".create" do
    it "creates a new peep post" do
      Chitter.create(post: "Hello world")
      expect(Chitter.all).to include 'Hello world'
    end
  end
end
