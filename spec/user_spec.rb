describe '.create' do
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(name: 'Test', email: 'test@example.com', password: 'password123')
  end
end
