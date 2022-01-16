describe '.create' do
  it 'creates a user' do
    user = User.create(name: 'Name', username: 'UserName', email: 'test@email.com', password: 'password')

    expect(user).to be_a User
    expect(user.username).to eq 'UserName'
  end
end
