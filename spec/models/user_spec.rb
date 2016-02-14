describe User do
  let(:user) do
    User.create(name:           'Michael Collins',
                email:        'michael@email.com',
                username:           'mjcollins86',
                password:              'p4ssw0rd',
                password_confirmation: 'p4ssw0rd')
  end

  it 'authenticates the user when provided a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(User.first).to eq authenticated_user
  end

  it 'does not authenticate when the password is incorrect' do
    expect(User.authenticate(user.email, 'wrong')).to be_nil
  end
end
