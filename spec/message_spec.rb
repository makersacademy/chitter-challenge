require './lib/message'

describe Message do

  it 'has the date' do
    @message = Message.new('where''s my heads', '@winter_coming', 'Ned Stark')
    expect(@message.date).to be_an_instance_of(Date)
  end

  it 'has the time' do
    @message = Message.new('where''s my heads', '@winter_coming', 'Ned Stark')
    expect(@message.time).to be_an_instance_of(Time)
  end

  it 'has the user handle' do
    @message = Message.new('where''s my head', '@winter_coming', 'Ned Stark')
    expect(@message.user_handle).to eq '@winter_coming'
  end

  let(:user_mock) { double :user, :handle => '@winter_coming' }
  it 'has the user name' do
    @message = Message.new('where''s my head', '@winter_coming', 'Ned Stark')
    expect(@message.user_name).to eq 'Ned Stark'
  end

  it 'holds a message' do
    @message = Message.new('where''s my head', '@winter_coming', 'Ned Stark')
    expect(@message.text).to eq 'where''s my head'
  end

end
