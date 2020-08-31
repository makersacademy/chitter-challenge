describe '.create' do
  it 'creates a new user' do
    user = User.create(name: 'Test Person', handle: '@mrtest', email: 'test@example.com', password: 'password123')
    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(peep.id).to be persisted_data['id']
    expect(user.name).to eq 'Test Person'
    expect(user.handle).to eq '@mrtest'
    expect(user.email).to eq 'test@example.com'
  end
end
