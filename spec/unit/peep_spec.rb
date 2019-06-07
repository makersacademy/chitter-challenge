require "peep"

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
    peep = Peep.new(content: "I exist!", date: "2019-06-06 12:20:22.123456")
    expect(peep.content).to eq("I exist!")
  end

  it "can exists knowing time and date" do
    peep = Peep.new(content: "Me", date: "2019-06-06 12:20:20")
    expect(peep.date).to eq("2019-06-06 12:20:20")
  end
end
