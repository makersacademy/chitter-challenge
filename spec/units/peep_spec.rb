require 'peep'

describe Peep do

  it "should create a peep (message) " do
    peep = Peep.create(content: "Hello")
    expect(peep.content).to eq("Hello")
  end

end
