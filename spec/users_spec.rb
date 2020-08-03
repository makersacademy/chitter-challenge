describe User do
  before do
    User.create('Alexis', 'test@test.com', 'password123')
  end

  it 'creates new users' do
    users = User.all
    expect(users.length).to eq(1)
    expect(users.name).to eq('Alexis')
    expect(users.email).to eq('test@test.com')
  end
end
