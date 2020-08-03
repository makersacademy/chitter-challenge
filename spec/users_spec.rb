describe User do
  before do
    User.create(name: 'Alexis', email: 'test@test.com', password: 'password123')
  end

  it 'creates new users' do
    users = User.all
    expect(users.length).to eq(1)
    expect(users.first.name).to eq('Alexis')
    expect(users.first.email).to eq('test@test.com')
  end
end
