require 'user'

describe Message do

  before(:each) do
    @example_time = Time.new
    @formatted_time = @example_time.strftime("%k:%M")
    allow(Time).to receive(:new) {@example_time}
    @test_user = User.create(name: 'Test', username: 'Testusername', email: 'test@test.com', password: 'password')
  end

  describe '::create' do
    it 'adds a post to the database table' do
      new_message = Message.create(user_message: "Hello", username: 'Testusername').first
      expect(new_message['message']).to eq("Hello")
      expect(new_message['created_at']).to eq(@formatted_time)
    end
  end

  describe '::all' do
    it 'displays all the messages in the message table' do
      Message.create(user_message: "Hello", username: 'Testusername').first
      expect(Message.all[0].message).to eq("Hello")
    end
    it 'displays the messages newest first' do
      Message.create(user_message: "Hello", username: 'Testusername').first
      Message.create(user_message: "Hello again", username: 'Testusername').first
      expect(Message.all[0].message).to eq("Hello again")
      expect(Message.all[0].created_at).to eq(@formatted_time)
      expect(Message.all[1].message).to eq("Hello")
      expect(Message.all[1].created_at).to eq(@formatted_time)
    end
  end

  describe '::current_time' do
    it 'returns a formatted time' do
      expect(Message.current_time).to eq(@formatted_time)
    end
  end

  describe '#find_user' do
    it 'finds the user associated with the username' do
      Message.create(user_message: "Hello", username: 'Testusername').first
      test_message = Message.all[0]
      expect(test_message.find_user.name).to eq(@test_user.name)
    end
  end


end
