require './lib/message'

describe "Message" do
  it "has an author, body and date" do
    peep = Message.new('Victor', 'Hello Chitter!', '2020-06-07 21:54:00')
    expect(peep.author).to eq 'Victor'
    expect(peep.body).to eq 'Hello Chitter!'
    expect(peep.date).to eq '2020-06-07 21:54:00'
  end
end