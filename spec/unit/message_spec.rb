require './app/models/message'

describe 'Message' do
  it 'has a content and time created' do
    message = Message.new(id: 1, content:'Hi', created_at:'09:20', user_id: 1)
    expect(message.id).to eq 1
    expect(message.content).to eq 'Hi'
    expect(message.created_at).to eq '09:20'
  end

  it 'shows the username' do
    message = Message.new(id: 1, content:'Hi', created_at: '09:20', user_id: 2)
    expect(message.user_id).to eq 2
  end
end