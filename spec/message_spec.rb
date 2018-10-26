require './lib/message.rb'

describe Message do
  let(message) { described_class.new }
  it "Stores a user's message" do
    message("Yes, yes you are")
    expect(message.post).to eq("Yes, yes you are")
  end
end
