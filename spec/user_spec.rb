require 'user'

describe User do
  it 'can be create a new user' do
    user = User.add(username: 'user1', password: 'password123', email: 'user1@gmail.com', name: 'user name')
    expect(user.username).to eq 'user1'
  end

  it 'is possible to see a list of peeps' do
    expect { User.add(username: 'user1', password: 'password123', email: 'user1@gmail.com', name: 'user name') }.to change { User.list.count }.by 1
  end

  # it 'is not possible to login with an incorrect username' do
  #   User.add(username: 'user1', password: 'password123')
  #   expect(User.login(username: 'user2', password: 'password123')).to eq false
  # end
  #
  # it 'is not possible to login with an incorrect password' do
  #   User.add(username: 'user1', password: 'password123')
  #   expect(User.login(username: 'user2', password: 'password')).to eq false
  # end
end
