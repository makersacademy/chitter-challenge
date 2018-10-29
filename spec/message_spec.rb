require "message.rb"
require "Communicationmanager.rb"

describe Message do

  before(:each){
    @user = User.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    @message = described_class.create(sender: @user.id, text: "How are you?")
    @messages = described_class.all
  }

  it "create" do
    expect(@messages.length).to eq 1
    expect(@messages[0].text).to eq "How are you?"
    expect(@messages[0].sender).to eq @user.name
    expect(@messages[0].response_to).to eq 0
  end

  it "all" do
    message2 = described_class.create(sender: @user.id, text: "How are you really?")
    message3 = described_class.create(sender: @user.id, text: "How are you really really?")
    messages = described_class.all
    expect(messages.length).to eq 3
  end

  it "all -  sorted order by create time desc" do
    message2 = described_class.create(sender: @user.id, text: "How are you really?")
    message3 = described_class.create(sender: @user.id, text: "How are you really really?")
    messages = described_class.all
    expect(messages.length).to eq 3
    expect(messages[0].text).to eq "How are you really really?"
    expect(messages[1].text).to eq "How are you really?"
    expect(messages[2].text).to eq "How are you?"
  end

  it "update" do
    described_class.update(id: @message.id, sender: @user.id, text: "I am fine")
    messages = described_class.all
    expect(messages[0].text).to eq "I am fine"
  end

  it "find" do
    message1 = described_class.find(id: @message.id)
    expect(message1.text).to eq "How are you?"
  end

  it "reply to message" do
    message2 = described_class.reply(response_to: @message.id, sender: @user.id, text: "This is a reply")
    messages = described_class.all
    expect(messages.length).to eq 2
    expect(messages[0].text).to eq "This is a reply"
    expect(messages[1].text).to eq "How are you?"
    expect(messages[1].id.to_i).to eq messages[0].response_to
  end

  it "delete" do
    described_class.delete(id: @message.id)
    messages = described_class.all
    expect(messages).to eq "No messages"
  end

  it "delete message and its reply" do
    message2 = described_class.reply(response_to: @message.id, sender: @user.id, text: "This is a reply")
    messages = described_class.all
    expect(messages.length).to eq 2
    described_class.delete(id: @message.id)
    messages = described_class.all
    expect(messages).to eq "No messages"
  end

  it "delete message and its reply and its reply and its..." do
    message2 = described_class.reply(response_to: @message.id, sender: @user.id, text: "This is a reply")
    message3 = described_class.reply(response_to: message2.id, sender: @user.id, text: "This is a reply to a reply")
    message4 = described_class.create(sender: @user.id, text: "This original message has no reply")
    messages = described_class.all
    expect(messages.length).to eq 4
    described_class.delete(id: @message.id)
    messages = described_class.all
    expect(messages.length).to eq 1
  end

  it "find tags in a message" do
    text1 = "@Sherlock How are you?  @Morpheus"
    expect(Communicationmanager).to receive(:send_email)
    described_class.email_tagged_users(text: text1, sender: "John")
  end

end
