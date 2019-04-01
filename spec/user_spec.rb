require './app/lib/user'

describe User do

  it 'all method' do
    User.create(email: 'test@email.com', password: 'password123')
    users = User.all
    expect(users.length).to eq(1)
    expect(users.first.email).to eq('test@email.com')
  end

  it 'creates method' do
    user = User.create(email: 'test@email.com', password: 'password123')
    expect(user.email).to eq('test@email.com')
    expect(user.password).to eq('password123')
  end

  

end