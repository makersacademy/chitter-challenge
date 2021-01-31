require './lib/peep'

describe Peep do
  context "on feed page" do
    it "has a time" do
      peep = Peep.create(text: "Hiya")
      time = Time.now.to_s.split(".")[0].split(" ")[0..1].join(" ")
      expect(peep.date.split(".")[0]).to eq time
    end
  end
end
