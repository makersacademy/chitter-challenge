require './lib/all_messages'
require './lib/message'

describe AllMessages do
  am = AllMessages.new
  it 'is initialised with an empty array' do
    expect(subject.content).to eq [] 
  end

  it 'adds a message object' do
    m1 = Message.new("Bananas are great")
    m2 = Message.new("Also oranges though?!")

    am.add_message(m1)
    am.add_message(m2)

    expect(am.display).to include("Bananas are great")
    expect(am.display).to include("Also oranges though?!")
  end
end

# allow(@computer).to receive(:choose).and_return( "Rock" )