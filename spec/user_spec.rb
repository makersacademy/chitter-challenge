require 'user'

describe 'create' do
  it 'creates a new user' do
    user = User.create(email: 'testemail2@gmail.com', password: 'password123', username: 'testuser2', name: 'testname' )

    expect(user).to be_a User
    expect(user.name).to eq 'testname'
    expect(user.email).to eq 'testemail2@gmail.com'
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end
