require 'peep'

describe Peep do
  it 'Contains @id, @peep, @peeped_at, @peeped_by instance variables' do
    test_peep = Peep.new(id: 1, peep: "hello", peeped_at: "today", peeped_by: "me")
    expect(test_peep.id).to eq(1)
    expect(test_peep.peep).to eq("hello")
    expect(test_peep.peeped_at).to eq("today")
    expect(test_peep.peeped_by).to eq("me")
  end

  it 'displays a timestamp with the instance variable @peeped_at' do
    Peep.post(peep: "test peep")
    results = Peep.all
    expect(results[0].peeped_at).to include("2020")
  end

  describe '#post' do
    it "adds a new peep to the database" do
      test_peep = Peep.post(peep: "Test Peep")
      expect(test_peep.peep).to eq("Test Peep")
      expect(test_peep).to be_an_instance_of(Peep)
    end
  end

  describe '#all' do
    it "creates a an array containing instances of Peeps" do
      Peep.post(peep: "test peep")
      Peep.post(peep: "another peep")
      Peep.post(peep: "a third peep")
      results = Peep.all
      expect(results[0].peep).to eq("a third peep")
      expect(results[1].peep).to eq("another peep")
      expect(results[2].peep).to eq("test peep")
    end
  end

end
