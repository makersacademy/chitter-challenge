require './lib/chitter'

describe Chitter do

  context ".all" do
    it "displays all the peeps in reverse chronological" do
      Chitter.create(post: "Dear Diary", timestamp: "17:24 01/01/2022")
      Chitter.create(post: "Unicorns are real", timestamp: "17:25 01/01/2022")
      peeps = Chitter.all
      expect(peeps[0]).to be_a Chitter
      expect(peeps.length).to eq 2
      expect(peeps[0].post).to include "Unicorns are real"
      expect(peeps[1].post).to include "Dear Diary"
    end
  end
    
  context ".create" do
    it "creates a new peep post" do
      Chitter.create(post: "Hello world", timestamp: "17:24 01/01/2022")
      expect(Chitter.all[0].post).to include "Hello world"
    end
  end

  context "time" do
    it "prints out the time the message was posted" do
      time_now = Time.now.strftime("%H:%M %d/%m/%Y")
      allow(Time).to receive(:now).and_return(time_now)
      Chitter.create(post: "Hello world", timestamp: time_now)
      expect(Chitter.all[0].timestamp).to eq time_now
    end
  end
end
