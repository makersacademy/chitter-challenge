require './lib/user'

describe User do
  
  it 'creates an account' do
    
    User.create(email: 'user@example.com', name: 'Test User', username: 'testuser', password: '123456')

    expect(User.all.count).to eq 1
  end

  it 'signs a user in' do

    User.create(email: 'user@example.com', name: 'Test User', username: 'testuser', password: '123456')

    user = User.login(email: 'user@example.com', password: '123456')

    expect(user).to be_a User
    expect(user.email).to eq 'user@example.com'
  end

  it 'can find a single user' do

    user = User.create(email: 'user@example.com', name: 'Test User', username: 'testuser', password: '123456')
    found_user = User.find(user_id: user.id)

    expect(found_user).to be_a User
    expect(found_user.id).to eq user.id
  end
end
