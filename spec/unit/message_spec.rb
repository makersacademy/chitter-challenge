require 'message'

describe Message do
  it 'creates a message in the database' do
    expect(Message.create(text: "This is my first tweet")).to have_attributes(:text => "This is my first tweet")
  end

  it 'returns current messages' do
    Message.create(text: "Today I am on top of the world. Yesterday I was in space")

    expect(Message.all.first).to have_attributes(:text => "Today I am on top of the world. Yesterday I was in space")
  end
end
