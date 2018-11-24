require 'message'
describe Message do

  it 'User can post a message to chitter' do
    Message.add('Hello World')
    all_messages = Message.all
    expect(all_messages).to include('Hello World')
  end

end