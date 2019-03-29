require 'message'

describe Message do
  it 'creates a message in the database' do
    expect(Message.create(text: "This is my first peep")).to have_attributes(:text => "This is my first peep")
  end

  it 'returns current messages' do
    Message.create(text: "Today I am on top of the world. Yesterday I was in space")

    expect(Message.all.first).to have_attributes(:text => "Today I am on top of the world. Yesterday I was in space")
  end

  it 'updates a text in order to change the timestamp' do
    message = Message.create(text: "Today I am on top of the world. Yesterday I was in space")
    Message.update(text: "Hot air balloon", id: message.id)
    expect(Message.all.first).to have_attributes(:text => "Hot air balloon")
  end
end
