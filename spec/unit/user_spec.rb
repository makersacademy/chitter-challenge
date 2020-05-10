require 'user'

describe User do

  describe '#all' do
    it 'returns all users' do
      first_user = User.add(name: 'James Smith', email: 'jamessmith@hotmail.com', username: 'james_smith', password: 'Password123')
      User.add(name: 'Jane Doe', email: 'janedoe@hotmail.com', username: 'jane_doe', password: 'Jane2020')

      users = User.all

      expect(users.length).to eq 2
      expect(users.first).to be_a User
      expect(users.first.name).to include first_user.name
      expect(users.first.username).to eq first_user.username
      expect(users.first.password).to eq first_user.password

    end
  end

  describe '#add' do
    it 'adds user to the user table' do
      first_user = User.add(name: 'James Smith', email: 'jamessmith@hotmail.com', username: 'james_smith', password: 'Password123')

      users = User.all

      expect(users.length).to eq 1
      expect(users.first).to be_a User
      expect(users.first.name).to include first_user.name
      expect(users.first.username).to eq first_user.username
      expect(users.first.password).to eq first_user.password
    end
  end

  describe '#authenticate' do
    context 'returns true with username and password' do
      it 'checks username and password' do
        User.add(name: 'James Smith', email: 'jamessmith@hotmail.com', username: 'james_smith', password: 'Password123')

        expect(User.authenticate(username: 'james_smith', password: 'Password123')).to eq true
      end
    end

    context 'returns false with incorrect username and password' do
      it 'checks username and password' do
        User.add(name: 'James Smith', email: 'jamessmith@hotmail.com', username: 'james_smith', password: 'Password123')

        expect(User.authenticate(username: 'james_smith', password: 'kassword123')).to eq false
      end
    end
  end

  describe '#get' do
    it 'creates a new user object' do
      User.add(name: 'James Smith', email: 'jamessmith@hotmail.com', username: 'james_smith', password: 'Password123')
      expect(User.get(username: 'james_smith')).to be_a User
    end
  end
end
