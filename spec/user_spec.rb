describe 'create method' do
  it 'encrypts password with bcrypt' do
    expect(BCrypt::Password).to receive(:create).with('password1234')
    User.create(username: 'test_user', password: 'password1234')
  end
end
