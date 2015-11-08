describe User do
  let (:user) {described_class.create(username: 'gwpmad',email: 'george@test.com',name: 'George',password: '12345')}

  it 'returns the correct user when email and password are correct' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
