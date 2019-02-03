require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@test.com', password: 'password', name: 'name')
    expect(user).to be_a User
    expect(user.email).to eq('test@test.com')
    expect(user.password).to eq('password')
    expect(user.name).to eq('name')
  end
end
