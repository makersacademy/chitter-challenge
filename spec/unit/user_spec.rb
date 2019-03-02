require './lib/user'

describe User do
  it 'creates an account' do
    
    User.create(email: 'user@example.com', name: 'Test User', username: 'testuser', password: '123456')

    expect(User.all.count).to eq 1
  end
end
