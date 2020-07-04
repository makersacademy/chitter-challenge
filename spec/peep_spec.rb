require './lib/peep.rb'

describe Peep do
  it 'initializes with a message and name' do
    peep = Peep.new("Hello this is my message", "James")
    expect(peep.message).to eq("Hello this is my message")
    expect(peep.user).to eq("James")
  end
end