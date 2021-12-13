require 'message'
require 'user'

describe Message do

  describe '.view_all' do
    it 'should return a message' do
      User.create('Pikachu', 'mightypikachu', 'pikachu@gmail.com', '13579pikapika')
      Message.add('My first message', 1)
      Message.add('My second message', 1)
      expect(Message.view_all[1].message).to include 'My first message'
      expect(Message.view_all[0].message).to include 'My second message'
    end
  end

  describe '.add' do
    it 'should add a chitter post' do
      user = User.create('Pikachu', 'mightypikachu', 'pikachu@gmail.com', '13579pikapika')
      message = Message.add('My first message', user[0]['id'])

      expect(Message.view_all[0].message).to include 'My first message'
    end
  end

  describe '#user' do
    it 'returns a user' do
      User.create('Pikachu', 'mightypikachu', 'pikachu@gmail.com', '13579pikapika')
      DatabaseConnection.query("INSERT INTO messages (id, post, user_id) VALUES(1, 'This is a test', $1);", [1])
      
      user = Message.view_all[0].user.first

      expect(user['u_name']).to eq 'Pikachu'
    end
  end
end
