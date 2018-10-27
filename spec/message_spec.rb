require "message.rb"

describe Message do

  it "can create a new message" do
    user = User.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    message = described_class.create(sender: user.id, text: "How are you?")
    messages = described_class.all
    expect(messages.length).to eq 1
  end

  it "ensure that created message can be retrieved correctly" do
    user = User.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    message = described_class.create(sender: user.id, text: "How are you?")
    messages = described_class.all
    expect(messages[0].text).to eq "How are you?"
    expect(messages[0].sender).to eq user.id
    expect(messages[0].response_to).to eq 0
  end

  it "can fetch all the messages" do
    user = User.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    message1 = described_class.create(sender: user.id, text: "How are you?")
    message2 = described_class.create(sender: user.id, text: "How are you really?")
    message3 = described_class.create(sender: user.id, text: "How are you really really?")
    messages = described_class.all
    expect(messages.length).to eq 3
  end

  it "can fetch all the messages in sorted order by create time desc" do
    user = User.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    message1 = described_class.create(sender: user.id, text: "How are you?")
    message2 = described_class.create(sender: user.id, text: "How are you really?")
    message3 = described_class.create(sender: user.id, text: "How are you really really?")
    messages = described_class.all
    expect(messages.length).to eq 3
    expect(messages[0].text).to eq "How are you really really?"
    expect(messages[1].text).to eq "How are you really?"
    expect(messages[2].text).to eq "How are you?"

  end


end
