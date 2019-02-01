require 'user'

describe User do
  it 'can be create a new user' do
    user = User.add(username: 'user1', password: 'password123')
    expect(user.username).to eq 'user1'
  end

  it 'is possible to see a list of peeps' do
    expect { User.add(username: 'user1', password: 'password123') }.to change { User.list.count }.by 1
  end
end
