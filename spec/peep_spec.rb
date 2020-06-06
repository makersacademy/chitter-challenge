require 'peep'

describe Peep do
  it 'Contains @id, @peep, @peeped_at, @peeped_by instance variables' do
    test_peep = Peep.new(id: 1, peep: "hello", peeped_at: "today", peeped_by: "me")
    expect(test_peep.id).to eq(1)
    expect(test_peep.peep).to eq("hello")
    expect(test_peep.peeped_at).to eq("today")
    expect(test_peep.peeped_by).to eq("me")
  end
  
end
