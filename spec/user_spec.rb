require_relative '../lib/user'

describe User do
  let(:subject) { User }
  
  describe '.create' do
    it 'creates a new user record in the user databse' do
      user = subject.create(name: 'name3', username: 'username3', email: 'name3@email.com', password: 'password')
      expect(user.name).to include('name3')
    end

    it 'wraps database data in User object and assigns instance variables' do
      user = subject.create(name: 'name2', username: 'username2', email: 'name2@email.com', password: 'password')
      expect(user.name).to eq 'name2'
      expect(user.username).to eq 'username2'
      expect(user.email).to eq 'name2@email.com'
      expect(user.password).to eq 'password'
    end

  end

  describe '.authenticate' do
    it 'returns a user if given a correct username and password' do
      user = subject.create(name: 'name4', username: 'username4', email: 'name4@email.com', password: 'password4')
      authenticated_user = subject.authenticate(username: 'username4', password: 'password4')
  
      expect(authenticated_user.id).to eq user.id
    end
  end
end