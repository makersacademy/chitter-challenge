describe 'create method' do
  it 'encrypts password with bcrypt' do
    expect(BCrypt::Password).to receive(:create).with('password1234')
    User.create(username: 'test_user', password: 'password1234')
  end

  it 'authenticate returns a user with correct username and password' do
    user = User.create(username: 'spec_tester', password: 'specpassword123')
    authenticated_user = User.authenticate(username: 'spec_tester', password: 'specpassword123')
    expect(authenticated_user.id).to eq(user.id)
  end
end
