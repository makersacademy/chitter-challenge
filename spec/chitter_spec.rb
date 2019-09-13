require 'chitter'

describe Chitter do
  it "calls postPeep, and gets back peep" do
    Database_Helper.clear_table
    expect(subject.postPeep("My First Peep").peep).to eq("My First Peep")
  end

  it "writes and reads from database" do
    Database_Helper.clear_table
    subject.postPeep("My Second Peep")
    expect(subject.getPeeps().first.peep).to eq("My Second Peep")
  end
end
