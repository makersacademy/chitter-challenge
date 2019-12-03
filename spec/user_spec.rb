require 'user'

describe 'create' do
  it 'creates a new user' do
    user = User.create(email: 'testemail@gmail.com', password: 'password123', username: 'testuser', name: 'testname' )

    expect(user).to be_a User
    expect(user.id).to eq '1'
    expect(user.email).to eq 'testemail@gmail.com'
  end
end
