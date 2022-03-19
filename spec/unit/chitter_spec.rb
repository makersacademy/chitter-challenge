require './lib/chitter'

describe Chitter do

  context ".all" do
    it "displays all the peeps" do
      Chitter.create(post: "Dear Diary")
      Chitter.create(post: "Unicorns are real")
      peeps = Chitter.all
      expect(peeps[0]).to be_a Chitter
      expect(peeps.length).to eq 2
      expect(peeps.first.post).to eq "Dear Diary"
    end
  end
    
  context ".create" do
    it "creates a new peep post" do
      Chitter.create(post: "Hello world")
      expect(Chitter.all[0].post).to include "Hello world"
    end
  end
end
