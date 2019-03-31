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

  it 'adds a user to the peep when one is provided' do
    Message.create(text: "Today is Sunday. One day before Monday", user_id: "1")

    expect(Message.all.first).to have_attributes(:text => "Today is Sunday. One day before Monday")
    expect(Message.all.first).to have_attributes(:user_id => "1")
  end

  it 'adds -1 user_id to the peep when one is not provided' do
    Message.create(text: "Today is Sunday. One day before Monday")

    expect(Message.all.first).to have_attributes(:text => "Today is Sunday. One day before Monday")
    expect(Message.all.first).to have_attributes(:user_id => "-1")
  end
end
