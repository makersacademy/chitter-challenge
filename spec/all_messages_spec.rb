require './lib/all_messages'
require './lib/message'

describe AllMessages do
  am = AllMessages.new
  it 'is initialised with an empty array' do
    expect(subject.content).to eq [] 
  end

  it 'adds a message object' do
    m1 = Message.new(content: "Bananas are great", id: "3", time: "4")
    m2 = Message.new(content: "Also oranges though?!", id: "5", time: "6")

    am.add_message(m1)
    am.add_message(m2)

    expect(am.display).to include("Bananas are great")
    expect(am.display).to include("Also oranges though?!")
  end
end
