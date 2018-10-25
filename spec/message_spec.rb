require './lib/message'

describe Message do

  it 'has the date' do
    @message = Message.new
    expect(@message.date).to be_an_instance_of(Date)
  end

  it 'has the time' do
    @message = Message.new
    expect(@message.time).to be_an_instance_of(Time)
  end

  let(:user_mock) { double :user, :handle => '@winter_coming' }
  it 'has the user handle' do
    @message = Message.new
    expect(@message.user_handle(user_mock)).to eq '@winter_coming'
  end

  it 'has the user name' do

  end

  it 'holds a message' do
    @message = Message.new
    expect(@message.text('Winter is coming')).to eq 'Winter is coming'
  end

end
