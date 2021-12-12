describe '.create' do
  it 'creates a new user' do
    user = User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')

    expect(user).to be_a User
    expect(user.name).to eq "Ruby"
    expect(user.username).to eq "@rb"
    expect(user.email).to eq 'test@ruby.com'
  end
end