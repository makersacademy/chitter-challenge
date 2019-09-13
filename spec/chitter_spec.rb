require 'chitter'

describe Chitter do
  it "calls postPeep, and gets back peep" do
    expect(subject.postPeep("My First Peep")).to eq("My First Peep")
  end

  it "writes and reads from database" do
    subject.postPeep("My Second Peep")
    expect(subject.getPeeps().first.peep).to eq("My Second Peep")
  end
end
