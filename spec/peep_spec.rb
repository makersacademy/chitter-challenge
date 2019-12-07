require "peep"
require 'pg'

describe Peep do
  describe ".all" do
    it "should return an empty list if no comment has been made" do
      peeps = Peep.all

      expect(peeps.length).to eq 0
    end

    it "should return the peep list" do
      peep = Peep.create(content: "First message")
      Peep.create(content: "Second message")
      Peep.create(content: "Third message")
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0].id).to eq peep.id
      expect(peeps[0].content).to eq "First message"
      expect(peeps[1].content).to eq "Second message"
      expect(peeps[2].content).to eq "Third message"
    end
  end

  describe ".create" do
    it "should create a new message" do
      peep = Peep.create(content: "First message")
      persistent_data = persistent_data(id: peep.id)

      peeps = Peep.all

      expect(peeps[0].id).to eq persistent_data['id']
      expect(peeps[0].content).to eq "First message"
    end
  end
end
