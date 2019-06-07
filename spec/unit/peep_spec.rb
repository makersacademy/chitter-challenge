require 'peep'

describe Peep do
  it "can add entry do the database to store peeps" do
    Peep.create("My first peep")
    messages = Peep.all
    expect(messages.length).to eq(1) 
  end
end