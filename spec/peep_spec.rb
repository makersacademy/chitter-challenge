require "peep"
require 'pg'

describe Peep do
  before :all do
    post_time = Time.new(2019, 02, 24, 12, 0, 0, "+00:00")
    Timecop.freeze(post_time)
  end

  describe ".all" do
    it "should return an empty list if no peeps have been made" do
      peeps = Peep.all

      expect(peeps.length).to eq 0
    end

    it "should return all the peeps" do
      peep = Peep.create(content: "First peep")
      Peep.create(content: "Second peep")
      Peep.create(content: "Third peep")
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0]).to be_a Peep
      expect(peeps[0].id).to eq peep.id
      expect(peeps[0].content).to eq "First peep"
      expect(peeps[0].time).to eq "2019-02-24 12:00:00"
    end
  end

  describe ".create" do
    it "should create a new peep" do
      peep = Peep.create(content: "First peep")
      persistent_data = persistent_data(table: :peeps, id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persistent_data['id']
      expect(peep.content).to eq "First peep"
      expect(peep.time).to eq "2019-02-24 12:00:00"
    end
  end
end
