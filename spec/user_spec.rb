require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@test.com', password: 'password')
    expect(user).to be_a User
    expect(user.email).to eq('test@test.com')
    expect(user.password).to eq('password')
  end
end
