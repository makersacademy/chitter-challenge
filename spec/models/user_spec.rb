require './app/models/user'

describe User do

  let!(:user) do
    User.create(name: 'name',
                username: 'test',
                email: 'test@test.test',
                password: 'password123',
                password_confirmation: 'password123')
  end

  it 'returns user object if password entered matches hashed password' do
    expect(User.authenticate(user.username, user.password)).to eq user
  end

  it 'returns nil if password entered does not match hashed password' do
    expect(User.authenticate(user.username, 'password456')).to eq nil
  end
end
