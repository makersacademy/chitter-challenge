require 'peep'

describe Peep do
  it "should return a list of bookmarks when .all is called" do
    p ENV
    peep = Peep.create(peep_content: "I just built my own computer")
    
    list_of_peeps = Peep.all

    expect(list_of_peeps.last).to be_a Peep
    expect(list_of_peeps.last.id).to eq peep.id
    expect(list_of_peeps.last.peep_content).to eq peep.peep_content
  end

  it "shoud save the content when .create is called" do

    peep = Peep.create(peep_content: "I just built my own computer")

    expect(peep.peep_content).to eq("I just built my own computer")
  end
end