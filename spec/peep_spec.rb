require 'peep'

describe Peep do
  it 'Contains @id, @peep, @peeped_at, @peeped_by instance variables' do
    test_peep = Peep.new(id: 1, peep: "hello", peeped_at: "today", peeped_by: "me")
    expect(test_peep.id).to eq(1)
    expect(test_peep.peep).to eq("hello")
    expect(test_peep.peeped_at).to eq("today")
    expect(test_peep.peeped_by).to eq("me")
  end

  describe '#post' do
    it "adds a new peep to the database" do
      test_peep = Peep.post(new_peep: "Test Peep")
      expect(test_peep.peep).to eq("Test Peep")
    end
  end
  
end
