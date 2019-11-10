describe User do
  it 'creates a new user' do
    expect(User.create(
      email: 'email@example.com',
      password: 'password123',
      name: 'Jo Bloggs',
      username: 'JoBlo'
    )).to be_a User
  end

  it 'has an email, password, name and username' do
    jo = User.create(email: 'email@example.com', password: 'password123', name: 'Jo Bloggs', username: 'JoBlo')
    expect(jo.email).to eq 'email@example.com'
    expect(jo.password).to eq 'password123'
    expect(jo.name).to eq 'Jo Bloggs'
    expect(jo.username).to eq 'JoBlo'
  end
end
