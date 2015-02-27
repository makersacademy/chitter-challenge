require 'spec_helper'

describe Message do

  it "should be created and then retrieved from the database" do 
    expect(Message.count).to eq 0
    Message.create(content: "Hello, World!")
    expect(Message.count).to eq 1
    message = Message.first
    expect(message.content).to eq("Hello, World!")
    message.destroy
    expect(Message.count).to eq 0
  end
end