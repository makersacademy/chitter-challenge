require 'message'
require './config/data_mapper'

describe Message do
  subject(:message) { Message.create(:content => 'Hello') }
  it "knows its content" do
    expect(message.content).to eq 'Hello'
  end
  it "knows its time" do
    expect(message.display_time).to eq Time.now.strftime('%d-%m-%y | %H:%M:%S')
  end
end
