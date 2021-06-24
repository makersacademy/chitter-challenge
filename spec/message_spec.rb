require './lib/message.rb'

describe Message do

  before(:each) do
    @example_time = Time.new
    @formatted_time = @example_time.strftime("%k:%M")
    allow(Time).to receive(:new) {@example_time}
  end

  describe 'self.create' do
    it 'adds a post to the database table' do
      message = Message.create(user_message: "Hello").first
      expect(message['message']).to eq('Hello')
      expect(message['created_at']).to eq(@formatted_time)
    end
  end

  describe 'self.all' do
    it 'displays all the messages' do
      Message.create(user_message: "Hello").first
      expect(Message.all[0].message).to eq("Hello")
    end
  end

  it 'displays the messages newest first' do
    Message.create(user_message: "Hello").first
    Message.create(user_message: "Hello again").first
    expect(Message.all[0].message).to eq("Hello again")
    expect(Message.all[0].created_at).to eq(@formatted_time)
    expect(Message.all[1].message).to eq("Hello")
    expect(Message.all[1].created_at).to eq(@formatted_time)
  end

  describe '::current_time' do
    it 'returns a formatted time' do
      expect(Message.current_time).to eq(@formatted_time)
    end
  end

end