require 'peep'

describe Peep do
  it "can add entry do the database to store peeps" do
    connect_delete_and_create_data
    messages = Peep.all
    expect(messages.length).to eq(2) 
  end

  it "can lists all the peeps" do
    expect(Peep.all.last.content).to eq("I have just added this")
  end

  it "comes to live with a content" do
    peep = Peep.new(content: "I exist!")
    expect(peep.content).to eq("I exist!")
end
end