require 'user'

describe User do
  it 'Can create a new user' do
    user = User.add(username: 'Username', password: 'password')
    expect(user.username).to eq 'Username'
  end
  it 'Can see a list of users' do
    expect { User.add(username: 'Username', password: 'password') }.to change { User.all.count }.by 1
  end
end
